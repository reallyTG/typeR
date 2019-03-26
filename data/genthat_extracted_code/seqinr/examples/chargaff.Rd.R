library(seqinr)


### Name: chargaff
### Title: Base composition in ssDNA for 7 bacterial DNA
### Aliases: chargaff
### Keywords: datasets

### ** Examples

data(chargaff)
op <- par(no.readonly = TRUE)
par(mfrow = c(4,4), mai = rep(0,4), xaxs = "i", yaxs = "i")
xlim <- ylim <- c(0, 100)

for( i in 1:4 )
{
  for( j in 1:4 )
  {
    if( i == j )
    {
      plot(chargaff[,i], chargaff[,j],t = "n", xlim = xlim, ylim = ylim,
      xlab = "", ylab = "", xaxt = "n", yaxt = "n")
      polygon(x = c(0, 0, 100, 100), y = c(0, 100, 100, 0), col = "lightgrey")
      for( k in seq(from = 0, to = 100, by = 10) )
      {
        lseg <- 3
        segments(k, 0, k, lseg)
        segments(k, 100 - lseg, k, 100)
        segments(0, k, lseg, k)
        segments(100 - lseg, k, 100, k)
      }
      string <- paste(names(chargaff)[i],"\n\n",xlim[1],"% -",xlim[2],"%")
      text(x=mean(xlim),y=mean(ylim), string, cex = 1.5)
    }
    else
    {
      plot(chargaff[,i], chargaff[,j], pch = 1, xlim = xlim, ylim = ylim,
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", cex = 2)
      iname <- names(chargaff)[i]
      jname <- names(chargaff)[j]
      direct <- function() segments(0, 0, 50, 50, col="blue")
      invers <- function() segments(0, 50, 50, 0, col="blue")
      PR2 <- function()
      {
        if( iname == "[A]" & jname == "[T]" ) { direct(); return() }
        if( iname == "[T]" & jname == "[A]" ) { direct(); return() }
        if( iname == "[C]" & jname == "[G]" ) { direct(); return() }
        if( iname == "[G]" & jname == "[C]" ) { direct(); return() }
        invers()
      }
      PR2()
      polygon(x = c(0, 100, 100), y = c(100, 100, 0), col = "pink4")
      polygon(x = c(0, 0, 100), y = c(0, 100, 0))
    }
  }
}
# Clean up
par(op)



