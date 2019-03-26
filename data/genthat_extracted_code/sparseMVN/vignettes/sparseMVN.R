## ----echo=FALSE, cache=FALSE-----------------------------------------------
suppressPackageStartupMessages(library("sparseMVN"))
suppressPackageStartupMessages(library("Matrix"))
suppressPackageStartupMessages(library("mvtnorm"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("xtable"))
suppressPackageStartupMessages(library("ggplot2"))

knitr::render_sweave()
knitr::opts_chunk$set(prompt=TRUE, cache=FALSE,error=FALSE,
                      comment="#", collapse=FALSE) #$
options(replace.assign=TRUE, width=77, prompt="R> ",
        digits=4, xtable.include.rownames=FALSE,
        xtable.booktabs=TRUE)
sanitize <- function(x) x

## ----echo=FALSE------------------------------------------------------------
N <- 5
k <- 2
p <- k ## dimension of mu
nv1 <- N*k+p
nels1 <- nv1^2
nnz1 <- N*k^2 + 2*p*N*k + p^2
nnz1LT <- N*k*(k+1)/2  + p*N*k + p*(p+1)/2
Q <- 1000
nv2 <- Q*k+p
nels2 <- nv2^2
nnz2 <- Q*k^2 + 2*p*Q*k + p^2
nnz2LT <- Q*k*(k+1)/2 + p*Q*k + p*(p+1)/2
options(scipen=999)

## ----blockarrow, echo=FALSE, comment=NA------------------------------------
Mat <- as(kronecker(diag(N), matrix(1, k, k)),"sparseMatrix")
Mat <- rbind(Mat, Matrix(1, p, N*k))
Mat <- cbind(Mat, Matrix(1, k*N+p, p))
printSpMatrix(as(Mat,"nMatrix"))

## ----banded, echo=FALSE, comment=NA----------------------------------------
Mat <- kronecker(Matrix(1, k, k), diag(N))
Mat <- rbind(Mat, Matrix(1, p, N * k))
Mat <- cbind(Mat, Matrix(1, k*N+p, p))
printSpMatrix(as(Mat,"nMatrix"))

## ----echo=FALSE, results="hide"--------------------------------------------
Mat2 <- as(kronecker(diag(Q),matrix(1,k,k)),"lMatrix") %>%
    rbind(Matrix(TRUE,p,Q*k)) %>%
    cbind(Matrix(TRUE, k*Q+p, p)) %>%
    as("dgCMatrix") %>%
    as("symmetricMatrix")
A2 <- as(Mat2,"matrix")

## ----eval=FALSE, prompt=FALSE----------------------------------------------
#  rmvn.sparse(n, mu, CH, prec=TRUE)
#  dmvn.sparse(x, mu, CH, prec=TRUE, log=TRUE)

## ----results='hide'--------------------------------------------------------
D <- sparseMVN::binary.sim(N=50, k=2, T=50)
priors <- list(inv.A=diag(2), inv.Omega=diag(2))
start <- rep(c(-1,1),51)
opt <- trustOptim::trust.optim(start,
                               fn=sparseMVN::binary.f,
                               gr=sparseMVN::binary.grad,
                               hs=sparseMVN::binary.hess,
                               data=D, priors=priors,
                               method="Sparse",
                               control=list(function.scale.factor=-1))

## --------------------------------------------------------------------------
R <- 100
pm <- opt[["solution"]]
H <- -opt[["hessian"]]
CH <- Cholesky(H)


## --------------------------------------------------------------------------
samples <- rmvn.sparse(R, pm, CH, prec=TRUE)
logf <- dmvn.sparse(samples, pm, CH, prec=TRUE)

## --------------------------------------------------------------------------
Matrix::nnzero(H)
Hinv <- drop0(solve(H))
Matrix::nnzero(Hinv)

## --------------------------------------------------------------------------
logf_dense <- dmvnorm(samples, pm, as.matrix(Hinv), log=TRUE)
all.equal(logf, logf_dense)

## ----echo=FALSE------------------------------------------------------------
load("runtimes.Rdata")

## ----echo=FALSE------------------------------------------------------------
tab1 <- filter(runtimes, stat %in% c("density","rand")) %>%
    group_by(N, k, stat, pattern, type) %>%
    summarize(mean_ms=mean(time/1000000),
              sd_ms=sd(time/1000000)) %>%
    tidyr::gather(time, value, c(mean_ms, sd_ms)) %>%
    reshape2::dcast(N+k+stat+time~pattern+type)


tab2 <- filter(runtimes, stat %in% c("chol","solve")) %>%
    group_by(N, k, stat, pattern, type) %>%
    summarize(mean_ms=mean(time/1000000),
              sd_ms=sd(time/1000000)) %>%
    tidyr::gather(time, value, c(mean_ms, sd_ms)) %>%
    reshape2::dcast(N+k+time~stat+pattern)

## ----echo=FALSE,results='asis'---------------------------------------------
tmp <- c("\\multirow{8}{*}{k=2}",rep(NA,7),
         "\\multirow{8}{*}{k=4}",rep(NA,7))
mutate(cases, tmp=tmp) %>%
    select(tmp,N, nvars,nels,
           nnz, nnzLT, pct.nnz) %>%
    xtable::xtable(digits=c(rep(0,7),3)) %>%
    print(include.rownames=FALSE,only.contents=TRUE,
          include.colnames=FALSE,
          floating=FALSE, sanitize.colnames.function=sanitize,
          sanitize.text.function=sanitize,
          hline.after=8,
          format.args=list(big.mark=","))

## ----echo=FALSE------------------------------------------------------------
tmp <- filter(tab1, N==min(tab1[['N']]) & k==min(tab1[['k']])
              & time=="mean_ms" & stat=="density")
sm <- with(tmp, c(dense_cov,sparse_cov))

## ----echo=FALSE, fig.height=5----------------------------------------------
theme_set(theme_bw())
fig1 <- filter(tab1, time=="mean_ms") %>%
    mutate(stat=plyr::revalue(stat, c(density="density", rand="random"))) %>%
    rename(dense=dense_cov, sparse=sparse_cov) %>%
    tidyr::gather(pattern, value, c(dense, sparse)) %>%
    ggplot(aes(x=N, y=value, color=pattern, shape=pattern, linetype=pattern)) %>%
    + geom_line() %>%
    + geom_point(size=2) %>%
    + scale_x_continuous("Number of blocks (N)") %>%
    + scale_y_continuous("Computation time (milliseconds)", labels=scales::comma) %>%
    + scale_color_manual("Pattern",values=c(dense='red', sparse='blue')) %>%
    + scale_shape("Pattern") %>%
    + scale_linetype("Pattern") %>%
    + facet_grid(stat~k, scales="free_y", labeller=label_bquote(cols = k==.(k))) %>%
    + theme(strip.background=element_rect(fill='white'))
fig1

## ----echo=FALSE,fig.height=3-----------------------------------------------
fig2 <- filter(tab2, time=="mean_ms") %>%
    rename(`dense inversion`=solve_dense,
           `dense Cholesky`=chol_dense, `sparse Cholesky`=chol_sparse) %>%
    tidyr::gather(pattern, value, c(`dense inversion`,`sparse Cholesky`,`dense Cholesky`)) %>%
    ggplot(aes(x=N, y=value, color=pattern, shape=pattern, linetype=pattern)) %>%
    + geom_line() %>%
    + geom_point(size=2) %>%
    + scale_x_continuous("Number of blocks (N)") %>%
    + scale_y_continuous("Computation time (milliseconds)", labels=scales::comma) %>%
    + scale_color_manual("Pattern/Operation",
                         values=c(`dense Cholesky`='red', `sparse Cholesky`='blue',
                                  `dense inversion`='black')) %>%
    + scale_shape("Pattern/Operation") %>%
    + scale_linetype("Pattern/Operation") %>%
    + facet_grid(.~k, scales="free_y", labeller=label_bquote(cols = k==.(k))) %>%
    + theme(strip.background=element_rect(fill='white'))
fig2

