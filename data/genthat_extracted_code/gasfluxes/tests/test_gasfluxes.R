library(gasfluxes)
context("gasfluxes checks")

test_that("gasfluxes returns expected values", {
  skip_on_cran() #less NA values on winbuilder
  res <- gasfluxes(fluxMeas[1:20,], 
                   .id = "serie", .V = "V", .A = "A",
                   .times = "time", .C = "C", 
                    methods=c("linear", "robust linear","HMR", "original HMR", "NDFE"),verbose=FALSE, plot = FALSE)
  expect_equal(data.table:::setDF(res), 
               structure(list(serie = c("ID1", "ID2", "ID3", "ID4", "ID5"), 
                              linear.f0 = c(0.0555669866740785, -0.0611626095687461, -0.0428897148924301, 
                                            -0.0111793261413552, 0.041840210297243), 
                              linear.f0.se = c(0.028697055158409, 
                                               0.0263636317002555, 0.0425127107690505, 0.0599487242659592, 
                                               0.00840546056899412), 
                              linear.f0.p = c(0.19245050979196, 0.146138869452879, 
                                              0.419251528032237, 0.86926934170296, 0.0380688306059213), 
                              linear.C0 = c(0.308970790118557, 0.475855538008889, 0.465418448020012, 
                                            0.385341651037846, 0.333253184107449), 
                              linear.AIC = c(-10.9887845537839, 
                                             -11.6825495623863, -8.01509608282695, -5.16760526792864, 
                                             -21.0235708278954), 
                              linear.AICc = c(Inf, Inf, Inf, Inf, Inf
                              ), 
                              linear.RSE = c(0.040927093104423, 0.0375274115555534, 
                                             0.0593530390736887, 0.0847274536777346, 0.0116749320402043
                              ), 
                              linear.r = c(0.80754949020804, -0.853861130547121, -0.580748471967763, 
                                           -0.13073065829704, 0.961931169394079), 
                              linear.diagnostics = c("", 
                                                     "", "", "", ""), 
                              robust.linear.f0 = c(0.0555669866740785, 
                                                   -0.0611626095687461, -0.0303109387388622, 0.00681856647255265, 
                                                   0.041840210297243), 
                              robust.linear.f0.se = c(0.028697055158409, 
                                                      0.0263636317002555, 0.0153424660030732, 0.0204971767735417, 
                                                      0.00840546056899412), 
                              robust.linear.f0.p = c(0.19245050979196, 
                                                     0.146138869452879, 0.163090704934176, 0.750421672669818, 
                                                     0.0380688306059213), 
                              robust.linear.C0 = c(0.308970790118557, 
                                                   0.475855538008889, 0.473272206610976, 0.339838564756016, 
                                                   0.333253184107449), 
                              robust.linear.weights = c("1|1|1|1", 
                                                        "1|1|1|1", "1|1|0.16|1", "1|0.15|1|1", "1|1|1|1"), 
                              robust.linear.diagnostics = c("", 
                                                            "", "", "", ""), 
                              HMR.f0 = c(NA, NA, -0.123566162944742, NA, 
                                         0.0418403302775212), HMR.f0.se = c(NA, NA, 0.39896371493858, 
                                                                            NA, 135759548593600), 
                              HMR.f0.p = c(NA, NA, 0.808792404502918, 
                                           NA, 1), 
                              HMR.kappa = c(NA, NA, 2.39686189586586, NA, 6.26517905920712e-06
                              ), 
                              HMR.phi = c(NA, NA, 0.383169270087676, NA, 12445.2133007081
                              ), 
                              HMR.AIC = c(NA, NA, -6.62832670015326, NA, -19.0235445653063
                              ), 
                              HMR.AICc = c(NA, NA, -46.6283267001533, NA, -59.0235445653063
                              ), 
                              HMR.RSE = c(NA, NA, 0.0777441330321253, NA, 0.0165109014333297
                              ), 
                              HMR.diagnostics = c("singular gradient", "Missing value or an infinity produced when evaluating the model", 
                                                  "", "Missing value or an infinity produced when evaluating the model", 
                                                  ""), 
                              original.HMR.f0 = c(0.0555669866740785, -0.0611626095687462, 
                                                  -0.123568879808343, 0, 0.0418402102972429), 
                              original.HMR.f0.se = c(0.028697055158409, 
                                                     0.0263636317002555, 0.100299647826534, NA, 0.00840546056899412
                              ), 
                              original.HMR.f0.p = c(0.19245050979196, 0.146138869452879, 
                                                    0.343139597683113, NA, 0.0380688306059212), 
                              original.HMR.kappa = c(NA, 
                                                     NA, 2.39693676099531, NA, NA), 
                              original.HMR.phi = c(NA, NA, 
                                                   0.383170338419227, NA, NA), 
                              original.HMR.AIC = c(NA, NA, 
                                                   -6.62832670016226, NA, NA), 
                              original.HMR.AICc = c(NA, NA, 
                                                    -46.6283267001623, NA, NA), 
                              original.HMR.RSE = c(NA, NA, 
                                                   0.0777441330320377, NA, NA), 
                              original.HMR.diagnostics = c("", 
                                                           "", "", "", ""), 
                              NDFE.f0 = c(NA_real_, NA_real_, NA_real_, 
                                          NA_real_, NA_real_), 
                              NDFE.f0.se = c(NA_real_, NA_real_, NA_real_, 
                                             NA_real_, NA_real_), 
                              NDFE.f0.p = c(NA_real_, NA_real_, NA_real_, 
                                            NA_real_, NA_real_), 
                              NDFE.tau = c(NA_real_, NA_real_, NA_real_, 
                                           NA_real_, NA_real_), 
                              NDFE.C0 = c(NA_real_, NA_real_, NA_real_, 
                                          NA_real_, NA_real_), 
                              NDFE.AIC = c(NA_real_, NA_real_, NA_real_, 
                                           NA_real_, NA_real_), 
                              NDFE.AICc = c(NA_real_, NA_real_, NA_real_, 
                                            NA_real_, NA_real_), 
                              NDFE.RSE = c(NA_real_, NA_real_, NA_real_, 
                                           NA_real_, NA_real_), 
                              NDFE.diagnostics = c("Missing value or an infinity produced when evaluating the model", 
                                                   "singular gradient", "Missing value or an infinity produced when evaluating the model", 
                                                   "Missing value or an infinity produced when evaluating the model", 
                                                   "Missing value or an infinity produced when evaluating the model"
                              )), 
                         .Names = c("serie", "linear.f0", "linear.f0.se", "linear.f0.p", 
                                    "linear.C0", "linear.AIC", "linear.AICc", "linear.RSE", "linear.r", 
                                    "linear.diagnostics", "robust.linear.f0", "robust.linear.f0.se", 
                                    "robust.linear.f0.p", "robust.linear.C0", "robust.linear.weights", 
                                    "robust.linear.diagnostics", "HMR.f0", "HMR.f0.se", "HMR.f0.p", 
                                    "HMR.kappa", "HMR.phi", "HMR.AIC", "HMR.AICc", "HMR.RSE", "HMR.diagnostics", 
                                    "original.HMR.f0", "original.HMR.f0.se", "original.HMR.f0.p", 
                                    "original.HMR.kappa", "original.HMR.phi", "original.HMR.AIC", 
                                    "original.HMR.AICc", "original.HMR.RSE", "original.HMR.diagnostics", 
                                    "NDFE.f0", "NDFE.f0.se", "NDFE.f0.p", "NDFE.tau", "NDFE.C0", 
                                    "NDFE.AIC", "NDFE.AICc", "NDFE.RSE", "NDFE.diagnostics"), 
                         row.names = c(NA, -5L), class = "data.frame"))
  
})

test_that("selection returns expected values with RF2011", {
  skip_on_cran() #less NA values on winbuilder
  res <- gasfluxes(fluxMeas[93:103,], 
                   .id = "serie", .V = "V", .A = "A",
                   .times = "time", .C = "C", 
                   methods=c("linear", "robust linear","HMR", "original HMR"),verbose=FALSE, plot = FALSE)
  expect_equal(as.data.frame(selectfluxes(res, "RF2011"))[c("flux", "flux.se", "flux.p", "method")],
               structure(list(flux = c(0.0986421209933125, 0.100514647653271, 
                                       0.00818862842964793), 
                              flux.se = c(0.0354126572273693, 0.00222643355841983, 
                                          0.0162290560441496), 
                              flux.p = c(0.100729644333585, 0.000490276741987375, 
                                         0.702511615452615), 
                              method = c("robust linear", "original HMR", 
                                         "linear")), 
                         .Names = c("flux", "flux.se", "flux.p", "method"), 
                         row.names = c(NA, -3L), 
                         class = "data.frame")        
               )
  expect_equal(as.data.frame(selectfluxes(res, "RF2011new"))[c("flux", "flux.se", "flux.p", "method")],
               structure(list(flux = c(0.0986421209933125, 0.100514669960856, 
                                       0.00818862842964793), 
                              flux.se = c(0.0354126572273693, 0.00886286546204357, 
                                          0.0162290560441496), 
                              flux.p = c(0.100729644333585, 0.0559890482039335, 
                                         0.702511615452615), 
                              method = c("robust linear", "HMR", "linear"
                              )), 
                         .Names = c("flux", "flux.se", "flux.p", "method"), 
                         row.names = c(NA, -3L), class = "data.frame")   
  )
}
)

test_that("selection returns expected values with RF2011new", {
  skip_on_cran() #less NA values on winbuilder
  res <- gasfluxes(fluxMeas[93:103,], 
                   .id = "serie", .V = "V", .A = "A",
                   .times = "time", .C = "C", 
                   methods=c("linear", "robust linear","HMR", "original HMR"),verbose=FALSE, plot = FALSE)
 
  expect_equal(as.data.frame(selectfluxes(res, "RF2011new"))[c("flux", "flux.se", "flux.p", "method")],
               structure(list(flux = c(0.0986421209933125, 0.100514669960856, 
                                       0.00818862842964793), 
                              flux.se = c(0.0354126572273693, 0.00886286546204357, 
                                          0.0162290560441496), 
                              flux.p = c(0.100729644333585, 0.0559890482039335, 
                                         0.702511615452615), 
                              method = c("robust linear", "HMR", "linear"
                              )), 
                         .Names = c("flux", "flux.se", "flux.p", "method"), 
                         row.names = c(NA, -3L), class = "data.frame")   
  )
}
)

test_that("selection returns expected values with kappa.max", {
  skip_on_cran() #less NA values on winbuilder
  res <- gasfluxes(fluxMeas[485:499,], 
                   .id = "serie", .V = "V", .A = "A",
                   .times = "time", .C = "C", 
                   methods=c("linear", "robust linear","HMR", "original HMR"),verbose=FALSE, plot = FALSE)
  expect_equal(as.data.frame(selectfluxes(res, "kappa.max", f.detect = 0.03, t.meas = 1))[c("flux", "flux.se", "flux.p", "method", "kappa.max")],
               structure(list(flux = c(0.0172439680316337, 0.028023512795377, 
                                       0.0897212054757933, 0.0498932647404164), 
                              flux.se = c(0.00780091069252072, 0.00651602824427401, 0.0504900608228271, 0.00822058452534422), 
                              flux.p = c(0.270458639172872, 0.0500419634199361, 0.32631519899426, 
                                         0.0260892939505948), 
                              method = c("linear", "robust linear", "HMR", "robust linear"), 
                              kappa.max = c(0.574798934387791, 0.934117093179233, 2.69886766312187, 1.66310882468055)), 
                         row.names = c(NA,-4L), class = "data.frame")    
  )
}
)

test_that("selectfluxes handles 'linear' HMR fit correctly", {
  skip_on_cran() 
  library(data.table)
  DT <- fread("Datum;Uhrzeit;Verschlusszeit;Standort;Plot;T Haube innen Anfang [°C];h_eff;N2O
            05.03.2019;15:48;0;2;D;6.1;0.344833333;323.76
            05.03.2019;16:08;0.3333;2;D;6.3;0.344833333;349.44
            05.03.2019;16:28;0.6667;2;D;6;0.344833333;344.74
            05.03.2019;16:48;1;2;D;5.8;0.344833333;411.28")
  DT[, n2o_mass := N2O * 28 * 273.15 / 22.4136 / (273.15 + `T Haube innen Anfang [°C]`)]
  DT[, A := 1] 
  
  N2O <- gasfluxes(DT[!is.na(n2o_mass)][, .(Datum, Standort, Plot, h_eff, A, Verschlusszeit, n2o_mass)], .id = c("Datum", "Standort", "Plot"), .V = "h_eff", .A = "A",
                   .times = "Verschlusszeit", .C = "n2o_mass", plot = FALSE, verbose = FALSE)
  f.detect <- c(`97.5%` = 12.1253368247024)
  t.meas <- 1
  

  expect_equal(as.data.frame(selectfluxes(N2O, "kappa.max", f.detect = f.detect, t.meas = t.meas))[c("flux", "flux.se", "flux.p", "method", "kappa.max")],
               structure(list(flux = 35.8503269424242, flux.se = 7.04713023648099, flux.p = 0.0314758844529013, 
                              method = "robust linear", kappa.max = 2.70589512450848), row.names = c(NA, -1L), class = "data.frame") 
  )
}
)



