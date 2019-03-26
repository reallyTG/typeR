rm(list=ls())
library("optimParallel")
library("microbenchmark")
library("ggplot2"); theme_set(theme_bw())

measure <- function(expr, times=5, unit="s"){
    m <- microbenchmark(list=expr, times=times)
    summary(m, unit="s")["mean"]
}


PAR <- 100
FN <- function(par, sleep){
    Sys.sleep(sleep)
    sum(par^2)
}
GR <- function(par, sleep){
    Sys.sleep(sleep)
    2*par
}

CONTROL <- list(maxit=10, factr=.Machine$double.eps)
METHOD <- "L-BFGS-B"
grid <- expand.grid(p=1:3,Tf=c(0,.05,.2,.4,.6,.8,1),
                    parallel=c("optimParallel","optim"), gr=FALSE, To=NA)
grid <- rbind(grid,
              data.frame(p=3, Tf=unique(grid$Tf), parallel="optimParallel", gr=TRUE, To=NA))
grid <- rbind(grid,
              data.frame(p=3, Tf=unique(grid$Tf), parallel="optim", gr=TRUE, To=NA))
cl <- makeCluster(8); setDefaultCluster(cl=cl)

for(i in 1:nrow(grid)){
    par <- rep(PAR, grid[i,"p"])
    if(grid[i,"parallel"]=="optimParallel"){
        if(grid[i,"gr"]){
            total <- measure(
                expression(out <<- optimParallel(par=par, fn=FN, gr=GR, sleep=grid[i,"Tf"],
                                                 method=METHOD,
                                                 control=CONTROL)))
        } else {
            total <- measure(
                expression(out <<- optimParallel(par=par, fn=FN, gr=NULL, sleep=grid[i,"Tf"],
                                                 method=METHOD,
                                                 control=CONTROL)))
        }
        grid[i, "To"] <- total/out$counts[1]
    } else {
        if(grid[i,"gr"]){
            total <- measure(
                expression(out <<- optim(par=par, fn=FN, gr=GR, sleep=grid[i,"Tf"],
                                         method=METHOD,
                                         control=CONTROL)))
        }else{
            total <- measure(
                expression(out <<- optim(par=par, fn=FN, gr=NULL, sleep=grid[i,"Tf"],
                                         method=METHOD,
                                         control=CONTROL)))
            }
        grid[i, "To"] <- total/out$counts[1]
    }
    print(grid[i,])
    print(out$counts[1])
}


save(grid, file="benchmark.RData")

pdf("benchmark.pdf", width = 8*.9*.9, height = 5*.8*.9)
size <- .8
sizes <- 4
stroke <- 1.1
shape <- 1
grid$par <- as.factor(grid$p)
grid$Tolog <- log(grid$To)
grid$parallel <- factor(grid$parallel)
#grid$parallel <- factor(grid$parallel,levels(grid$parallel)[c(2,1)])
grid$pa <- factor(ifelse(grid$gr, paste0("p = ", grid$par, ", gradient"), paste("p =", grid$par)))
grid$pa <- factor(grid$pa,levels(grid$pa)[c(3,2,1,4)])
ggplot(grid, aes(x=Tf, y=To, color=pa, group=interaction(pa,parallel),
                 linetype=parallel)) + geom_point(size=sizes, shape=shape, stroke=stroke) + geom_line(size=size) +
    geom_point(data=grid[grid$parallel=="optimParallel",], mapping=aes(x=Tf, y=To), color="black", size=sizes, shape=shape, stroke=stroke) +
    geom_line(data=grid[grid$parallel=="optimParallel"&grid$par==1,], mapping=aes(x=Tf, y=To),
              color="black", size=size) +
    xlab("Elapsed time [s] for one evalutation of fn(x)") +
    ylab("Elapsed time [s] per iteration") +
    theme(legend.title=element_blank()) +
    scale_x_continuous(minor_breaks = seq(0 , 1, .1), breaks = seq(0, 1, .2))
dev.off()
