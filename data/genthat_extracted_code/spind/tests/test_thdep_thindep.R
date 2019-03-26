context("Test th.dep and th.indep using PresenceAbsence")

library(PresenceAbsence)
data(hook)
data<- hook[,1:2]
coord<- hook[,3:4]

# calculate indices from spind and PresenceAbsence
ni1<-th.dep(data,coord,spatial=FALSE)

ID<-1:dim(data)[1]
datan<-cbind(ID,data[,1],data[,2])
CMX<-cmx(datan, threshold = 0.5)



test_that("confusion matrix and kappa are calculating correctly", {
  skip_on_cran()
  expect_equal(ni1$kappa, Kappa(CMX)[[1]][1]) # Kappa
  expect_equal(as.vector(ni1$cm), as.vector(CMX)) # Confusion Matrix
})
# spind metrics
ni2<-th.indep(data, coord, spatial = FALSE, plot.ROC = FALSE)

# PA metrics
pi <- data[ ,2]
o <- order(pi)
piord <- pi[o]
rp <- roc.plot.calculate(datan, threshold = piord)
aucn <- auc(datan)


test_that("sens, specificity,AUC, and TSS are calculated correctly", {
  skip_on_cran()
  expect_equal(ni2$TSS, max(rp[ ,3] + rp[ ,4]) - 1) # TSS
  expect_equal(ni2$sensitivity, rp[ ,3]) # Sens
  expect_equal(ni2$specificity, rp[ ,4]) # Spec
  expect_equal(ni2$AUC, as.double(aucn[1])) # AUC
  expect_is(ni2$plot, 'ggplot')

  expect_warning(th.indep(data, coord, spatial = FALSE, plot.ROC = TRUE),
                 regexp = '"customize_plot" and "plot.ROC" arguments are now soft deprecated' )
})

# calculate optimal kappa threshold for spind::th.dep
kappa <- rep(NA, 999)
for (i in 1:999){
  ii <- i / 1000
  ni1 <- th.dep(data, coord, thresh = ii, spatial = FALSE)
  kappa[i] <- ni1$kappa
}
opt.thresh <- which.max(kappa) / 1000

ni1 <- th.dep(data, coord, thresh = opt.thresh, spatial = FALSE)

opthr<-optimal.thresholds(datan, opt.methods = 1:4, threshold = length(pi))
CMX<-cmx(datan, threshold = opthr[[2]][4])


test_that("Optimal tresholds and th.dep indices are the same", {
  skip_on_cran()

  expect_equal(round(opt.thresh, 2), round(opthr[[2]][4], 2))
  expect_equal(ni1$kappa, Kappa(CMX)[[1]][1])
})

# calculate optimal threshold for spind::th.indep
ni2<-th.indep(data, coord, spatial = FALSE, plot.ROC = FALSE)
ni2$opt.thresh
opthr<-optimal.thresholds(datan, opt.methods=1:4, threshold = piord)
rpc<-roc.plot.calculate(datan, threshold = opthr[[2]][3])


test_that("Optimal thresholds and th.indep indices are the same", {
  skip_on_cran()
  expect_equal(ni2$opt.thresh, opthr[[2]][3])
  expect_equal(ni2$TSS, rpc$sensitivity +
                        rpc$specificity - 1)
})


test_that('Spatial corrected values are correct', {
  skip_on_cran()
  data(hook)
  data<- hook[,1:2]
  coord<- hook[,3:4]

  ni1 <- th.dep(data, coord, spatial = TRUE)
  ni2 <- th.indep(data, coord, spatial = TRUE, plot.ROC = FALSE)

  expect_equal(ni1$sensitivity, .61111, tolerance = 1e-4)
  expect_equal(ni1$specificity, .96341, tolerance = 1e-4)
  expect_equal(ni1$kappa, .6285, tolerance = 1e-4)
  expect_true(identical(ni1$splitlevel.act, ni1$splitlevel.pred))

  expect_equal(ni2$AUC, .9424, tolerance = 1e-4)
  expect_equal(ni2$opt.thresh, .1779, tolerance = 1e-4)
  expect_equal(ni2$TSS, .7425, tolerance = 1e-4)


})
