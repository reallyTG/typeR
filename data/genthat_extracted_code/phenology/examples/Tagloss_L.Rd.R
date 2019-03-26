library(phenology)


### Name: Tagloss_L
### Title: Return the -log likelihood of a set of individuals under a model
###   of tagloss.
### Aliases: Tagloss_L

### ** Examples

## Not run: 
##D library(phenology)
##D 
##D # Example with 21 format of data
##D 
##D data_f_21 <- Tagloss_format(outLR, model="21")
##D par <- structure(c(49.5658922243074, 808.136085362158, 106.283783786853, 
##D 5.22150592456511, 8.00608716525864, 8.32718202233396, 150.612916258503, 
##D 715.865805125223, 2242.06574225966, 119.212383120678, 10.1860735529433, 
##D 7.14231725937626), .Names = c("D1_2", "D2D1_2", "D3D2_2", "A_2", 
##D "B_2", "C_2", "D1_1", "D2D1_1", "D3D2_1", "A_1", "B_1", "C_1"))
##D pfixed <- NULL
##D # All the data are analyzed; the N20 are very long to compute
##D Tagloss_L(individuals=data_f_21, par=par, days.maximum=Tagloss_daymax(data_f_21), 
##D           fixed.parameters=pfixed, cores=1, progressbar=TRUE)
##D # Without the N20 the computing is much faster
##D data_f_21_fast <- subset(data_f_21, subset=(is.na(data_f_21$N20)))
##D Tagloss_L(individuals=data_f_21_fast, par=par, days.maximum=Tagloss_daymax(data_f_21_fast), 
##D           fixed.par=pfixed, cores=1, progressbar=TRUE)
##D o <- Tagloss_fit(data=data_f_21_fast, fitted.parameters=par)
##D # Here it is the result of the previous function
##D o <- structure(list(par = structure(c(49.5658922243074, 808.136085362158, 
##D 106.283783786853, 5.22150592456511, 8.00608716525864, 8.32718202233396, 
##D 150.612916258503, 715.865805125223, 2242.06574225966, 119.212383120678, 
##D 10.1860735529433, 7.14231725937626), .Names = c("D1_2", "D2D1_2", 
##D "D3D2_2", "A_2", "B_2", "C_2", "D1_1", "D2D1_1", "D3D2_1", "A_1", 
##D "B_1", "C_1")), value = 5841.93084262461, counts = structure(c(1093L, 
##D NA), .Names = c("function", "gradient")), convergence = 0L, message = NULL, 
##D     hessian = structure(c(0.0469808583147824, 0.000133240973809734, 
##D     6.68478605803102e-05, -2.53581288234273, -1.25931342154217, 
##D     -0.124650568977813, -2.46700437855907e-05, -1.11413100967184e-05, 
##D     -3.18323145620525e-06, 0, -0.0182945996130002, -0.00510601694259094, 
##D     0.000133240973809734, 1.45519152283669e-05, 7.50333128962666e-06, 
##D     -0.00452587300969753, -0.0191316757991444, -0.0255117811320815, 
##D     -1.13686837721616e-06, -1.36424205265939e-06, -2.27373675443232e-07, 
##D     0, 0.000335830918629654, -0.000448608261649497, 6.68478605803102e-05, 
##D     7.50333128962666e-06, 4.32009983342141e-06, -0.00226373231271282, 
##D     -0.00954059942159802, -0.0127809016703395, -4.54747350886464e-07, 
##D     -4.54747350886464e-07, -2.27373675443232e-07, 0, 0.000176896719494835, 
##D     -0.000224190443987027, -2.53581288234273, -0.00452587300969753, 
##D     -0.00226373231271282, 223.422489398217, 41.4073996353181, 
##D     3.77875949197914, 0.000986460690910462, 0.000398813426727429, 
##D     0.000117665877041873, 0, 0.727547330825473, 0.194675862985605, 
##D     -1.25931342154217, -0.0191316757991444, -0.00954059942159802, 
##D     41.4073996353181, 189.534394394286, 28.3386068531399, 0.00216437001654413, 
##D     0.00241834641201422, 0.000652562448522076, 0, 0.841939595375152, 
##D     1.0472297162778, -0.124650568977813, -0.0255117811320815, 
##D     -0.0127809016703395, 3.77875949197914, 28.3386068531399, 
##D     70.250493081403, -0.00022441781766247, -0.000161662683240138, 
##D     0.000257614374277182, 0, -0.578908839088399, 1.08917492980254, 
##D     -2.46700437855907e-05, -1.13686837721616e-06, -4.54747350886464e-07, 
##D     0.000986460690910462, 0.00216437001654413, -0.00022441781766247, 
##D     0.000148247636388987, 0.000145519152283669, 3.97903932025656e-05, 
##D     0, 0.0156976511789253, 0.0678746800986119, -1.11413100967184e-05, 
##D     -1.36424205265939e-06, -4.54747350886464e-07, 0.000398813426727429, 
##D     0.00241834641201422, -0.000161662683240138, 0.000145519152283669, 
##D     0.000145519152283669, 3.9676706364844e-05, 0, 0.0138438736030366, 
##D     0.0678776359563926, -3.18323145620525e-06, -2.27373675443232e-07, 
##D     -2.27373675443232e-07, 0.000117665877041873, 0.000652562448522076, 
##D     0.000257614374277182, 3.97903932025656e-05, 3.9676706364844e-05, 
##D     1.77351466845721e-05, 0, 0.00317095327773131, 0.0316927071253303, 
##D     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.0182945996130002, 
##D     0.000335830918629654, 0.000176896719494835, 0.727547330825473, 
##D     0.841939595375152, -0.578908839088399, 0.0156976511789253, 
##D     0.0138438736030366, 0.00317095327773131, 0, 8.85630879565724, 
##D     4.44044781033881, -0.00510601694259094, -0.000448608261649497, 
##D     -0.000224190443987027, 0.194675862985605, 1.0472297162778, 
##D     1.08917492980254, 0.0678746800986119, 0.0678776359563926, 
##D     0.0316927071253303, 0, 4.44044781033881, 88.8524673428037
##D     ), .Dim = c(12L, 12L), .Dimnames = list(c("D1_2", "D2D1_2", 
##D     "D3D2_2", "A_2", "B_2", "C_2", "D1_1", "D2D1_1", "D3D2_1", 
##D     "A_1", "B_1", "C_1"), c("D1_2", "D2D1_2", "D3D2_2", "A_2", 
##D     "B_2", "C_2", "D1_1", "D2D1_1", "D3D2_1", "A_1", "B_1", "C_1"
##D     )))), .Names = c("par", "value", "counts", "convergence", 
##D "message", "hessian"), class = "Tagloss")
##D par(mar=c(4, 4, 1, 1))
##D plot(o, t=1:3000, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red")
##D plot(o, t=1500:3000, model="1", scale=1000, 
##D             add=TRUE)
##D legend("topright", legend=c("2 -> 1", "1 -> 0"), col=c("red", "black"), lty=1)
##D 
##D plot(o, t=1:300, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red", hessian=o$hessian)
##D plot(o, t=1:300, model="1", scale=1000, 
##D             add=TRUE, hessian=o$hessian)
##D legend("topright", legend=c("2 -> 1", "1 -> 0"), col=c("red", "black"), lty=1)
##D 
##D ###### Example with fixed.parameters
##D 
##D data_f_21 <- Tagloss_format(outLR, model="21")
##D # Without the N20 the computing is much faster
##D data_f_21_fast <- subset(data_f_21, subset=(is.na(data_f_21$N20)))
##D par <- structure(c(49.5658922243074, 5.22150592456511, 8.00608716525864, 
##D                    50.612916258503, 6, 9), 
##D                 .Names = c("D1_2",  "A_2", "B_2", 
##D                            "D1_1",  "A_1", "B_1"))
##D pfixed <- c(D2D1_2=10000, D3D2_2=10000, C_2=0, D2D1_1=10000, D3D2_1=10000, C_1=0)
##D o <- Tagloss_fit(data=data_f_21_fast, fitted.parameters=par, fixed.parameters=pfixed)
##D # Here it is the result of the previous function
##D o <- structure(list(par = structure(c(55.2184044121564, 5.2630294044259, 
##D 8.13359029885985, 14269.9757684677, 21.8702023948044, 6.46586480967269
##D ), .Names = c("D1_2", "A_2", "B_2", "D1_1", "A_1", "B_1")), value = 5853.64634357369, 
##D     counts = structure(c(757L, NA), .Names = c("function", "gradient"
##D     )), convergence = 0L, message = NULL, hessian = structure(c(0.036636720324168, 
##D     -2.26385645873961, -1.2330608569755, -2.95585778076202e-06, 
##D     -2.27373675443232e-07, -0.0399197688238928, -2.26385645873961, 
##D     232.345637869003, 47.1904784262733, 0.000118689058581367, 
##D     7.50333128962666e-06, 1.69928603099834, -1.2330608569755, 
##D     47.1904784262733, 304.432723851278, 0.000196678229258396, 
##D     1.36424205265939e-06, 2.8553522497532, -2.95585778076202e-06, 
##D     0.000118689058581367, 0.000196678229258396, 4.54747350886464e-07, 
##D     0, 0.00741636085876962, -2.27373675443232e-07, 7.50333128962666e-06, 
##D     1.36424205265939e-06, 0, 4.00177668780088e-05, 8.79936123965308e-05, 
##D     -0.0399197688238928, 1.69928603099834, 2.8553522497532, 0.00741636085876962, 
##D     8.79936123965308e-05, 107.941018768543), .Dim = c(6L, 6L), .Dimnames = list(
##D         c("D1_2", "A_2", "B_2", "D1_1", "A_1", "B_1"), c("D1_2", 
##D         "A_2", "B_2", "D1_1", "A_1", "B_1")))), .Names = c("par", 
##D "value", "counts", "convergence", "message", "hessian"), class = "Tagloss")
##D par(mar=c(4, 4, 1, 1))
##D plot(o, t=1:3000, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red")
##D plot(o, t=1500:3000, model="1", scale=1000, 
##D             add=TRUE)
##D legend("topright", legend=c("2 -> 1", "1 -> 0"), col=c("red", "black"), lty=1)
##D 
##D plot(o, t=1:300, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red", hessian=o$hessian)
##D plot(o, t=1:300, model="1", scale=1000, 
##D             add=TRUE, hessian=o$hessian)
##D legend("topright", legend=c("2 -> 1", "1 -> 0"), col=c("red", "black"), lty=1)
##D 
##D ###### Example with delta
##D 
##D data_f_21 <- Tagloss_format(outLR, model="21")
##D # Without the N20 the computing is much faster
##D data_f_21_fast <- subset(data_f_21, subset=(is.na(data_f_21$N20)))
##D par <- structure(c(45.8764973711504, 5.22489974562498, 8.07602162728874, 
##D -0.865444694177429), .Names = c("D1_2", "A_2", "B_2", "delta"
##D ))
##D pfixed <- c(D2D1_2=10000, D3D2_2=10000, C_2=0)
##D o <- Tagloss_fit(data=data_f_21_fast, fitted.parameters=par, fixed.parameters=pfixed)
##D # Here it is the result of the previous function
##D o <- structure(list(par = structure(c(45.9035484983855, 5.22576211343279, 
##D 8.07585745169786, -0.865706100004634), .Names = c("D1_2", "A_2", 
##D "B_2", "delta")), value = 5913.716964613, counts = structure(c(91L, 
##D NA), .Names = c("function", "gradient")), convergence = 0L, message = NULL, 
##D     hessian = structure(c(0.0644593001197791, -2.88983483187621, 
##D     -1.49161280660337, -0.0875163550517755, -2.88983483187621, 
##D     221.02317802819, 45.3729608125286, 3.73816044429987, -1.49161280660337, 
##D     45.3729608125286, 440.129730122862, 30.4781699469459, -0.0875163550517755, 
##D     3.73816044429987, 30.4781699469459, 9.47964940678503), .Dim = c(4L, 
##D     4L), .Dimnames = list(c("D1_2", "A_2", "B_2", "delta"), c("D1_2", 
##D     "A_2", "B_2", "delta")))), .Names = c("par", "value", "counts", 
##D "convergence", "message", "hessian"), class = "Tagloss")
##D par(mar=c(4, 4, 1, 1))
##D plot(o, t=1:3000, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red")
##D plot(o, t=1:3000, model="1", scale=1000, col="blue", 
##D             add=TRUE, hessian=o$hessian)
##D legend("topright", legend=c("2 -> 1", "1 -> 0"), col=c("red", "black"), lty=1)
##D 
##D ###### Example with model_after
##D data_f_LR <- Tagloss_format(outLR, model="LR")
##D par <- structure(c(72.0399239978454, 58.1034231071992, 645.068735669251, 
##D                    5.10791337470247, 3538.47220045768, 7.83358940767931), 
##D                 .Names = c("D1_L2", "D2D1_L2", "D3D2_L2", "A_L2", "B_L2", "C_L2"))
##D pfixed <- NULL
##D # A progress bar can be shown when one core is used
##D system.time(
##D print(Tagloss_L(individuals=data_f_LR, par=par, days.maximum=Tagloss_daymax(data_f_LR), 
##D           fixed.parameters=pfixed, cores=1, model_after="pR2=pL2;pR1=pL2;pL1=pL2", 
##D           progressbar = TRUE))
##D )
##D # When parallel computing is done, no progress bar can be shown
##D system.time(
##D print(Tagloss_L(individuals=data_f_LR, par=par, days.maximum=Tagloss_daymax(data_f_LR), 
##D           fixed.parameters=pfixed, model_after="pR2=pL2;pR1=pL2;pL1=pL2"))
##D )
##D # The NLR_00 are very long to calculate
##D data_f_LR_fast <- subset(data_f_LR, subset=(is.na(data_f_LR$NLR_00)))
##D system.time(
##D print(Tagloss_L(individuals=data_f_LR_fast, par=par, days.maximum=Tagloss_daymax(data_f_LR_fast), 
##D           fixed.parameters=pfixed, model_after="pR2=pL2;pR1=pL2;pL1=pL2"))
##D )
##D o <- Tagloss_fit(data=data_f_LR_fast, 
##D                  fitted.parameters=par, fixed.parameters=pfixed, 
##D                   model_after="pR2=pL2;pR1=pL2;pL1=pL2")
##D 
##D par(mar=c(4, 4, 1, 1))
##D plot(o, t=1:3000, model="2", scale=1000, ylim=c(0, 3), 
##D             col="red")
## End(Not run)



