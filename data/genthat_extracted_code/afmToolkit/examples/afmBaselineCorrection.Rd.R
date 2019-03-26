library(afmToolkit)


### Name: afmBaselineCorrection
### Title: Performs a baseline correction to an AFM F-z curve
### Aliases: afmBaselineCorrection

### ** Examples

AFMcurve <- afmReadJPK("force-save-JPK-2h.txt.gz", path = path.package("afmToolkit"))
ZPointApp <- 6.43e-6
ZPointRet <- 6.45e-6
AFMcurve <- afmBaselineCorrection(AFMcurve,ZPointApp = ZPointApp,ZPointRet = ZPointRet)
plot(AFMcurve)

# Without providing ZPointApp
AFMcurve <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path.package("afmToolkit"))
AFMcurve <- afmContactPoint(AFMcurve,width = 10,mul1 = 1,mul2 = 20, 
                             loessSmooth = FALSE)
AFMcurve <- afmBaselineCorrection(AFMcurve)
plot(AFMcurve)




