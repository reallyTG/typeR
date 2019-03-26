library(mlxR)


### Name: writeDatamlx
### Title: Write formatted data file
### Aliases: writeDatamlx

### ** Examples

## Not run: 
##D modelPK <- inlineModel("
##D [LONGITUDINAL]
##D input = {V, Cl, a1}
##D EQUATION:
##D Cc = pkmodel(V, Cl)
##D DEFINITION:
##D y1 ={distribution=lognormal, prediction=Cc, sd=a1}
##D ")
##D adm  <- list(amount=100, time=seq(0,50,by=12))
##D p <- c(V=10, Cl=1, a1=0.1)
##D y1 <- list(name=c('y1'), time=seq(5,to=50,by=5))
##D res <- simulx(model=modelPK, treatment=adm, parameter=p, output=y1)
##D writeDatamlx(res, result.file="res.csv")
##D writeDatamlx(res, result.file="res.txt", sep="\t")
##D writeDatamlx(res, result.folder="res")
## End(Not run)



