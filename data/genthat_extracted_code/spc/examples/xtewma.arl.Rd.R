library(spc)


### Name: xtewma.arl
### Title: Compute ARLs of EWMA control charts, t distributed data
### Aliases: xtewma.arl
### Keywords: ts

### ** Examples

##  Borror/Montgomery/Runger (1999), Table 3
lambda <- 0.1
cE <- 2.703
df <- c(4, 6, 8, 10, 15, 20, 30, 40, 50)
L0 <- rep(NA, length(df))
for ( i in 1:length(df) ) {
  L0[i] <- round(xtewma.arl(lambda, cE*sqrt(df[i]/(df[i]-2)), df[i], 0), digits=0)
}
data.frame(df, L0)



