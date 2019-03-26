library(derivmkts)


### Name: greeks
### Title: Calculate option Greeks
### Aliases: greeks bsopt greeks2

### ** Examples

s=40; k=40; v=0.30; r=0.08; tt=0.25; d=0;
greeks(bscall(s, k, v, r, tt, d), complete=FALSE, long=FALSE, initcaps=TRUE)
greeks2(bscall, list(s=s, k=k, v=v, r=r, tt=tt, d=d))
greeks2(bscall, list(s=s, k=k, v=v, r=r, tt=tt, d=d))[c('Delta', 'Gamma'), ]
bsopt(s, k, v, r, tt, d)
bsopt(s, c(35, 40, 45), v, r, tt, d)
bsopt(s, c(35, 40, 45), v, r, tt, d)[['Call']][c('Delta', 'Gamma'), ]

## plot Greeks for calls and puts for 500 different stock prices
##
## This plot can generate a "figure margins too large" error
## in Rstudio
k <- 100; v <- 0.30; r <- 0.08; tt <- 2; d <- 0
S <- seq(.5, 250, by=.5)
Call <- greeks(bscall(S, k, v, r, tt, d))
Put <- greeks(bsput(S, k, v, r, tt, d))
y <- list(Call=Call, Put=Put)
par(mfrow=c(4, 4), mar=c(2, 2, 2, 2))  ## create a 4x4 plot
for (i in names(y)) {
    for (j in rownames(y[[i]])) {  ## loop over greeks
        plot(S, y[[i]][j, ], main=paste(i, j), ylab=j, type='l')
    }
}
## Not run: 
##D ## Using complete option for calls
##D call_long <- greeks(bscall(S, k, v, r, tt, d), complete=TRUE, long=TRUE)
##D ggplot2::ggplot(call_long, aes(x=s, y=value)) +
##D       geom_line() + facet_wrap(~greek, scales='free')
## End(Not run)



