library(gjam)


### Name: gjamSensitivity
### Title: Sensitivity coefficients for gjam
### Aliases: gjamSensitivity

### ** Examples

## Not run: 
##D ## combinations of scales
##D types <- c('DA','DA','OC','OC','OC','OC','CC','CC','CC','CC','CC','CA','CA','PA','PA')         
##D f    <- gjamSimData(S = length(types), typeNames = types)
##D ml   <- list(ng = 50, burnin = 5, typeNames = f$typeNames)
##D out  <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D 
##D ynames <- colnames(f$y)
##D group  <- ynames[types == 'OC']
##D 
##D full <- gjamSensitivity(out)
##D cc   <- gjamSensitivity(out, group)
##D 
##D nt <- ncol(full)
##D 
##D boxplot( full, boxwex = 0.25,  at = 1:nt - .21, col='blue', log='y',
##D          xaxt = 'n', xlab = 'Predictors', ylab='Sensitivity')
##D boxplot( cc, boxwex = 0.25, at = 1:nt + .2, col='forestgreen', add=T,
##D          xaxt = 'n')
##D axis(1,at=1:nt,labels=colnames(full))
##D legend('bottomright',c('full response','CC data'),
##D        text.col=c('blue','forestgreen'))
## End(Not run)



