## ---- echo = FALSE-------------------------------------------------------
  knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.align = "left")
  library(pdSpecEst)  

  a4width<- 8.3
  a4height<- 11.7
  
  plotspec <- function(i, data, data1 = NULL, est = F){

  freq <- pi * (0:(dim(data)[3]-1))/dim(data)[3]
  ylim <- range(1.1 * Re(data), 1.1 * Im(data))
  if(i[1] == i[2]){
    plot(range(freq), range(ylim), type = "n", main = paste0("Auto-spectrum (", i[1], ",", i[1], ")"),
         xlab = "", yaxt = "n", ylab = "", ylim = ylim, mgp = c(3,0.5,0), cex.main = 0.9)
    abline(h = 0, lty = 3)
      if(!is.null(data1)){
        lines(freq, Re(data1[i[1], i[1],]), col = 2, lwd = ifelse(est, 1.5, 1))
      }
      lines(freq, Re(data[i[1], i[1],]), lwd = ifelse(est, 1, 1.5))
    title(xlab = expression(paste("Frequency (", omega, ")")), line = 2)

  } else if(i[1] < i[2]) {
    plot(range(freq), ylim, type = "n", main = paste0("Real cross-spectrum (", i[1], ",", i[2], ")"),
         xlab = "", yaxt = "n", xaxt = "n", ylab = "", mgp = c(3,0.5,0), cex.main = 0.9)
    abline(h = 0, lty = 3)
    title(xlab = expression(paste("Frequency (", omega, ")")), line = 0.5)
      if(!is.null(data1)){
        lines(freq, Re(data1[i[1], i[2], ]), col = 2, lwd = ifelse(est, 1.5, 1))
      }
      lines(freq, Re(data[i[1], i[2], ]), lwd = ifelse(est, 1, 1.5))
  } else {
    plot(range(freq), ylim, type = "n", main = paste0("Imag. cross-spectrum (", i[1], ",", i[2], ")"),
         xlab = "", yaxt = "n", xaxt = "n", ylab = "", mgp = c(3,0.5,0), cex.main = 0.9)
    abline(h = 0, lty = 3)
    title(xlab = expression(paste("Frequency (", omega, ")")), line = 0.5)
      if(!is.null(data1)){
        lines(freq, Im(data1[i[1], i[2], ]), col = 2, lwd = ifelse(est, 1.5, 1))
      }
      lines(freq, Im(data[i[1], i[2], ]), lwd = ifelse(est, 1, 1.5))
  }
  }
  
  ## Plot wavelet coefficients
plotCoeff <- function(D, title, bias = 1){
  
  if (!requireNamespace("ggplot2", quietly = T) | 
      !requireNamespace("viridis", quietly = T) | 
      !requireNamespace("ggthemes", quietly = T) | 
      !requireNamespace("reshape2", quietly = T) | 
      !requireNamespace("grid", quietly = T)) {
    cat("Packages 'ggplot2', 'viridis', 'ggthemes', 'reshape2' and 'grid' needed for this function to work. Please install missing packages.")
  } else{
    
    cols <- colorRamp(viridis::viridis(20), bias = bias)
    RGB <- function(x) rgb(cols(x)[1], cols(x)[2], cols(x)[3], maxColorValue = 255, alpha = 255)
    RGB <- Vectorize(RGB, "x")
    
    L_b <- (dim(D[[1]])[3] - 1) / 2
    J <- length(D)
    D <- lapply(1:J, function(j) D[[j]][, , L_b + 1:2^(j - 1), drop = F])
    norms <- lapply(1:J, function(j) apply(D[[j]], 3, function(D) pdSpecEst:::NormF(D)))
    longData <- reshape2::melt(sapply(1:J, function(j) rep(norms[[j]], each = 2^(J - j))))
    
    gg <- ggplot2::ggplot(longData, ggplot2::aes(x = longData$Var1, y = longData$Var2, fill = longData$value)) +
      ggplot2::geom_raster() +
      ggplot2::scale_fill_gradientn(colours = RGB(seq(0,1,len=20)), limits = c(0,1.75)) +
      ggplot2::scale_x_continuous(breaks = NULL, labels = NULL, expand=c(0,0)) +
      ggplot2::scale_y_reverse(breaks = 1:J, labels=1:J, expand = c(0, 0)) +
      ggplot2::ggtitle(title) +
      ggplot2::labs(x = "Location", y = "scale") +
      ggthemes::theme_tufte(base_family="sans") +
      ggplot2::theme(plot.title=ggplot2::element_text(size=10, hjust=0), axis.text = ggplot2::element_text(size=8), axis.title=ggplot2::element_text(size=10), legend.key.width=grid::unit(0.2, "cm"), legend.title=ggplot2::element_blank(), legend.key.height = grid::unit(1.1, "cm"), legend.text = ggplot2::element_text(size=8))
    
    print(gg)
  }
}
  
plotspec2D <- function(P, lim = T, lim.val = NULL, Log = F, bias = 1){
  
  if (!requireNamespace("ggplot2", quietly = T) | 
      !requireNamespace("viridis", quietly = T) | 
      !requireNamespace("ggthemes", quietly = T) | 
      !requireNamespace("reshape2", quietly = T) | 
      !requireNamespace("grid", quietly = T)) {
    cat("Packages 'ggplot2', 'viridis', 'ggthemes', 'reshape2' and 'grid' needed for this function to work. Please install missing packages.")
  } else{
    
    d <- dim(P)[1]
    x_n <- min(dim(P)[3], 64)
    y_n <- min(dim(P)[4], 64)
    P <- P[,,as.integer(seq(from=1,to=dim(P)[3],len=x_n)),as.integer(seq(from=1,to=dim(P)[4],len=y_n))]
    grid_n <- expand.grid(1:x_n, 1:y_n)
    if(Log){
      P <- array(pdSpecEst:::Ptransf2D_C(array(P, dim = c(d, d, x_n * y_n)), F, F, "logEuclidean"), dim = c(d, d, x_n, y_n))
    }
    ylim <- (if(is.null(lim.val)){ range(mapply(function(i1, i2) range(Re(P[,,i1,i2]), Im(P[,,i1,i2])), grid_n$Var1, grid_n$Var2)) }else{ lim.val })
    if(!is.null(lim.val)){
    P <- array(complex(real = sapply(c(Re(P)), function(y) min(max(y,lim.val[1]),lim.val[2])), imaginary = sapply(c(Im(P)), function(y) min(max(y,lim.val[1]),lim.val[2]))), dim = dim(P))
    }
    grid::grid.newpage()
    grid::pushViewport(grid::viewport(layout = grid::grid.layout(d, d)))
    define_region <- function(row, col){
      grid::viewport(layout.pos.row = row, layout.pos.col = col)
    }
    
    marg <- 1/(2*d)
    
    for(d1 in 1:d){
      for(d2 in 1:d){
        if(d1 == d2){
          data <- Re(P[d1,d1,,])
          longdata <- reshape2::melt(data)
          longdata$Var1 <- rep(seq(from=1/x_n,to=1,len=x_n), times=y_n)
          longdata$Var2 <- rep(seq(from=0.5/y_n,to=0.5,len=y_n), each=x_n)
          
          gg <- ggplot2::ggplot(longdata, ggplot2::aes(x = longdata$Var1, y = longdata$Var2, fill = longdata$value)) +
            ggplot2::geom_raster() +
                     viridis::scale_fill_viridis(name = "", limits = (if(lim) ylim else NULL)) +
            ggplot2::labs(x = "Time (t)", y = expression(paste("Freq. (", omega, ")", sep ="")),
                          title = paste0("Auto-spectrum (", d1, ",", d1, ")")) +
            ggthemes::theme_tufte(base_family="sans") +
            ggplot2::theme(plot.title=ggplot2::element_text(hjust=0, size = 7), 
                           axis.ticks=ggplot2::element_blank(), axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = -2), size = 7), axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r = -6), size = 7), axis.text = ggplot2::element_blank(), legend.key.width=grid::unit(0.2, "cm"), legend.title=ggplot2::element_blank(), legend.key.height = grid::unit(0.6, "cm"), legend.text = ggplot2::element_text(size=6), legend.position = c(1.10, 0.52), 
                           plot.margin = grid::unit(c(5.5,30.5,5.5,5.5), "points"))
          
          print(gg, vp = define_region(d1, d1))
        } else{
          if(d2 > d1){
            data1 <- Re(P[d1,d2,,])
            longdata1 <- reshape2::melt(data1)
            longdata1$Var1 <- rep(seq(from=1/x_n,to=1,len=x_n), times=y_n)
            longdata1$Var2 <- rep(seq(from=pi/y_n,to=pi,len=y_n), each=x_n)
            
            gg1 <- ggplot2::ggplot(longdata1, ggplot2::aes(x = longdata1$Var1, y = longdata1$Var2, fill = longdata1$value)) +
              ggplot2::geom_raster() +
                     viridis::scale_fill_viridis(name = "", limits = (if(lim) ylim else NULL)) +
              ggplot2::labs(x = "Time (t)", y = expression(paste("Freq. (", omega, ")", sep = "")), title = paste0("Real cross-spec. (", d1, ",", d2, ")")) +
              ggthemes::theme_tufte(base_family="sans") +
              ggplot2::theme(plot.title=ggplot2::element_text(hjust=0, size = 7), 
                             axis.ticks=ggplot2::element_blank(), axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = -2), size = 7), axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r = -6), size = 7), axis.text = ggplot2::element_blank(), legend.key.width=grid::unit(0.2, "cm"), legend.title=ggplot2::element_blank(), legend.key.height = grid::unit(0.6, "cm"), legend.text = ggplot2::element_text(size=6), legend.position = c(1.1, 0.52), 
                             plot.margin = grid::unit(c(5.5,30.5,5.5,5.5), "points"))
            
            print(gg1, vp = define_region(d1,d2))
            
            data2 <- Im(P[d1,d2,,])
            longdata2 <- reshape2::melt(data2)
            longdata2$Var1 <- rep(seq(from=1/x_n,to=1,len=x_n), times=y_n)
            longdata2$Var2 <- rep(seq(from=pi/y_n,to=pi,len=y_n), each=x_n)
            
            gg2 <- ggplot2::ggplot(longdata2, ggplot2::aes(x = longdata2$Var1, y = longdata2$Var2, fill = longdata2$value)) +
              ggplot2::geom_raster() +
              viridis::scale_fill_viridis(name = "", limits = (if(lim) ylim else NULL)) +
              ggplot2::labs(x = "Time (t)", y = expression(paste("Freq. (", omega, ")", sep = "")), title = paste0("Imag. cross-spec. (", d1, ",", d2, ")")) +
              ggthemes::theme_tufte(base_family="sans") +
              ggplot2::theme(plot.title=ggplot2::element_text(hjust=0, size = 7), 
                             axis.ticks=ggplot2::element_blank(), axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = -2), size = 7), axis.title.y = ggplot2::element_text(margin = ggplot2::margin(r = -6), size = 7), axis.text = ggplot2::element_blank(), legend.key.width=grid::unit(0.2, "cm"), legend.title=ggplot2::element_blank(), legend.key.height = grid::unit(0.6, "cm"), legend.text = ggplot2::element_text(size=6), legend.position = c(1.1, 0.52), 
                             plot.margin = grid::unit(c(5.5,30.5,5.5,5.5), "points"))
            
            print(gg2, vp = define_region(d2,d1))
          }
        }
      }
    }
  }
}


## ------------------------------------------------------------------------
library(pdSpecEst)
## Generate 3-dim. time series with 'bumps' spectrum
set.seed(123)
n <- 2^10
bumps <- rExamples1D(n, example = "bumps", return.ts = T, noise = "periodogram")
str(bumps, digits.d = 1)

## ------------------------------------------------------------------------
## Multitaper spectral estimator with `pdPgram`
f.hat <- pdPgram(bumps$ts, B = 75); str(f.hat, digits.d = 1)

## ---- echo = F, fig.width=0.7*a4width, fig.height=0.38*a4height, fig.cap ="Figure 1: Generating HPD spectral matrix `bumps$f` in black and noisy mulitaper HPD periodogram `bumps$P` in red. The diagonal components have zero imaginary part and the missing off-diagonal components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
grid <- as.matrix(unname(expand.grid(1:3, 1:3)))
par(mfrow=c(3, 3), mar = c(3.5,1,1.5,1))
invisible(apply(grid, 1, function(i) plotspec(i, data = bumps$f, data1 = bumps$P)))

## ---- echo = F, fig.width=0.7*a4width, fig.height=0.38*a4height, fig.cap = "Figure 2: Generating HPD spectral matrix `bumps$f` in black and mulitaper HPD spectral estimator `f.hat$P` in red. The diagonal components have zero imaginary part and the missing off-diagonal components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
grid <- as.matrix(unname(expand.grid(1:3, 1:3)))
par(mfrow=c(3, 3), mar = c(3.5,1,1.5,1))
invisible(apply(grid, 1, function(i) plotspec(i, data = bumps$f, data1 = f.hat$P, est = T)))

## ------------------------------------------------------------------------
## Forward intrinsic AI wavelet transform
wt.f <- WavTransf1D(bumps$f, periodic = T)
wt.per <- WavTransf1D(bumps$P, periodic = T)

## ---- echo = F, fig.width=0.8*a4width, fig.height=0.23*a4height, fig.cap = "Figure 3: Frobenius norms of the whitened AI wavelet coefficients of the generating spectral matrix `bumps$f` based on an intrinsic AI wavelet transform of order $N = 5$, under the default affine-invariant metric, obtained with `WavTransf1D()`."----
plotCoeff(wt.f$D.white, title = "Frobenius norm of target (whitened) AI wavelet coefficients", bias = 1.5)

## ---- echo = F, fig.width=0.8*a4width, fig.height=0.23*a4height, fig.cap = "Figure 4: Frobenius norms of the whitened AI wavelet coefficients of the noisy HPD periodogram `bumps$P` based on an intrinsic AI wavelet transform of order $N = 5$, under the default affine-invariant metric, obtained with `WavTransf1D()`."----
plotCoeff(wt.per$D.white, title = "Frobenius norm of noisy periodogram (whitened) AI wavelet coefficients", bias = 1.5)

## ------------------------------------------------------------------------
f.hat <- pdSpecEst1D(bumps$P, return.D = "D.white"); str(f.hat, max.level = 1)

## ---- echo = F, fig.width=0.8*a4width, fig.height=0.23*a4height, fig.cap = "Figure 5: Frobenius norms of the nonlinear (tree-structured) thresholded whitened AI wavelet coefficients of the noisy HPD periodograms based on an intrinsic AI wavelet transform of order $N = 5$, under the default affine-invariant metric."----
plotCoeff(f.hat$D.white, title = "Frobenius norm of denoised (whitened) AI wavelet coefficients", bias = 1.5)

## ---- echo = F, fig.width=0.75*a4width, fig.height=0.4*a4height, fig.cap = "Figure 6: Generating spectrum `bumps$f` in black and wavelet-smoothed HPD spectral estimator `f.hat$f` in red. The diagonal components have zero imaginary part and the missing off-diagonal components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
grid <- as.matrix(unname(expand.grid(1:3, 1:3)))
par(mfrow=c(3, 3), mar = c(3.5,1,1.5,1))
invisible(apply(grid, 1, function(i) plotspec(i, data = bumps$f, data1 = f.hat$f, est = T)))

## ------------------------------------------------------------------------
## Fix parameter matrices
Phi1 <- array(c(0.5, 0, 0, 0.6, rep(0, 4)), dim = c(2, 2, 2))
Phi2 <- array(c(0.7, 0, 0, 0.4, rep(0, 4)), dim = c(2, 2, 2))
Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)

## Generate periodogram data for 10 subjects in 2 groups
pgram <- function(Phi) pdPgram(rARMA(2^9, 2, Phi, Theta, Sigma)$X)$P
P <- array(c(replicate(5, pgram(Phi1)), replicate(5, pgram(Phi2))), dim=c(2,2,2^8,10))

pdSpecClust1D(P, K = 2)$cl.prob

## ------------------------------------------------------------------------
## Generate noisy HPD surface
set.seed(17)
d <- 2; B <- 6; n <- c(2^7, 2^7)
smiley <- rExamples2D(n, d, example = "smiley", noise = "wishart", df.wishart = B)
str(smiley)

## ---- echo = F, fig.width=0.55*a4width, fig.height=0.3*a4height, fig.cap = "Figure 7: Matrix-logarithms of the target surface of HPD matrices `smiley$f` in time and frequency. The diagonal components have zero imaginary part and the missing off-diagonal matrix components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
 Pf <- smiley$f[,,as.integer(seq(from=1,to=n[1],len=64)), as.integer(seq(from=1,to=n[2],len=64))]
 Pf <- pdSpecEst:::Ptransf2D_C(array(Pf, dim = c(d, d, n[1] * n[2])), F, F, "logEuclidean")
 lim_val <- 1.25 * range(Re(Pf), Im(Pf))
 invisible(plotspec2D(smiley$f, lim = T, lim.val = lim_val, Log = T))

## ---- echo = F, fig.width=0.55*a4width, fig.height=0.3*a4height, fig.cap = "Figure 8: Matrix-logarithms of generated noisy surface of HPD matrices `smiley$P` in time and frequency. The diagonal components have zero imaginary part and the missing off-diagonal matrix components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
invisible(plotspec2D(smiley$P, lim = T, Log = T))

## ------------------------------------------------------------------------
f.hat <- pdSpecEst2D(smiley$P, order = c(1, 1), jmax = 6, B = B)
str(f.hat, max.level = 1)

## ---- echo = F, fig.width=0.55*a4width, fig.height=0.3*a4height, fig.cap = "Figure 9: Matrix-logarithms of denoised surface of HPD matrices `f.hat$f` in time and frequency. The diagonal components have zero imaginary part and the missing off-diagonal matrix components are uniquely determined by complex conjugation of the displayed off-diagonal components."----
invisible(plotspec2D(f.hat$f, lim = T, lim.val = lim_val, Log = T))

