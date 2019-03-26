library(psd)


### Name: parabolic_weights_rcpp
### Title: Calculate parabolic weighting factors.
### Aliases: parabolic_weights parabolic_weights.tapers
###   parabolic_weights_fast parabolic_weights_rcpp

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D library(grDevices)
##D library(RColorBrewer)
##D 
##D ##
##D ## Show parabolic weighting factors as a function of maximum tapers
##D ##
##D 
##D # maximum number of tapers
##D maxx <- 1e3
##D # sequence in logspace
##D xseq <- seq(from=1,to=2.8,by=0.2)
##D 
##D # plot palette
##D pal <- "Spectral"
##D npal <- switch(pal, RdYlBu=11, Spectral=11, Blues=9)
##D pal.col <- RColorBrewer::brewer.pal(npal, pal)
##D cols <- rev(grDevices::colorRampPalette(pal.col)(maxx))
##D 
##D to_df <- function(W){
##D   # convert parabolic results to data.frame
##D   with(W, data.frame(taper_seq=as.vector(taper_seq), taper_weights=as.vector(taper_weights)))
##D }
##D 
##D ## a roundabout way of bootstrapping y-axis limits:
##D #  upper
##D WgtsU <- parabolic_weights_fast(5)
##D DfU <- to_df(WgtsU)
##D #  lower
##D WgtsL <- parabolic_weights_fast(maxx)
##D DfL <- to_df(WgtsL)
##D 
##D ylims <- range(pretty(dB(c(DfL$taper_weights, DfU$taper_weights)))) + c(-2,5)
##D 
##D # function for plotting text
##D TFUN <- function(Df.){
##D   tx <- max(Df.$taper_seq)
##D   ty <- mean(Df.$taper_weights)
##D   text(log10(tx)+0.1, dB(ty), sprintf("%i", tx), col=cols[tx])
##D }
##D 
##D # function for weighting factors and plotting
##D WFUN <- function(x){
##D   message(x)
##D   Wgts <- parabolic_weights_fast(x)
##D   Df <- to_df(Wgts)
##D   lcol <- cols[x]
##D   lines(dB(taper_weights) ~ log10(taper_seq), Df, type="s", lwd=2, col=lcol)
##D   TFUN(Df)
##D }
##D 
##D ## Plot parabolic weighting, in dB, colored by maximum num tapers
##D plot(dB(taper_weights) ~ log10(taper_seq), DfU, type="s", 
##D      xlim=c(0, log10(maxx)+0.2), 
##D      ylim=ylims, yaxs="i",
##D      col=cols[5], lwd=2,  
##D      main="Multitaper weighting factors by maximum tapers applied",
##D      xlab="log10 taper sequence", 
##D      ylab="dB")
##D TFUN(DfU)
##D invisible(lapply(round(10**xseq), FUN=WFUN))
##D WFUN(maxx)
##D 
##D ##
## End(Not run)#REX



