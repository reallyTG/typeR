library(SASxport)
Sys.setenv("TZ"="GMT")

x <- data.frame(A=1:10,
                B=letters[1:10],
                C=factor(rep(NA,10)),
                D=factor(rep(NA,10), levels=c("A","B","C")),
                E=as.numeric(rep(NA,10)),
                stringsAsFactors=FALSE                
                )
write.xport(x,file='testFactorAllNA.out.xpt')

y <- read.xport(file='testFactorAllNA.out.xpt')

stopifnot( all.equal(x,y, check.attributes = FALSE) )
stopifnot( all.equal(levels(x$C), levels(y$C) ) )
stopifnot( all.equal(levels(x$D), levels(y$D) ) )
