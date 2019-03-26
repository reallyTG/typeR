## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.width = 6, fig.height = 5, fig.align = "center")

## ---- include = FALSE, echo = FALSE--------------------------------------
library(ggplot2)
library(dplyr)
library(tidyr)
library(purrr)

## ----CRAN, eval = FALSE--------------------------------------------------
#  install.packages("cutpointr")

## ------------------------------------------------------------------------
library(cutpointr)
data(suicide)
head(suicide)
cp <- cutpointr(suicide, dsi, suicide, 
                method = maximize_metric, metric = sum_sens_spec)
cp

## ------------------------------------------------------------------------
summary(cp)

## ------------------------------------------------------------------------
plot(cp)

## ------------------------------------------------------------------------
library(cutpointr)
data(suicide)
head(suicide)
opt_cut <- cutpointr(suicide, dsi, suicide)
opt_cut

## ------------------------------------------------------------------------
cutpointr(x = suicide$dsi, class = suicide$suicide)

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, direction = ">=", pos_class = "yes",
                     neg_class = "no", method = maximize_metric, metric = youden)
opt_cut

## ------------------------------------------------------------------------
summary(opt_cut)
plot(opt_cut)

## ------------------------------------------------------------------------
plot_metric(opt_cut)

## ------------------------------------------------------------------------
predict(opt_cut, newdata = data.frame(dsi = 0:5))

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, gender)
summary(opt_cut)
plot(opt_cut)

## ------------------------------------------------------------------------
set.seed(12)
opt_cut <- cutpointr(suicide, dsi, suicide, boot_runs = 50)
opt_cut

## ------------------------------------------------------------------------
opt_cut$boot

## ------------------------------------------------------------------------
summary(opt_cut)
plot(opt_cut)

## ------------------------------------------------------------------------
if (suppressPackageStartupMessages(require(doParallel) & require(doRNG))) {
  cl <- makeCluster(2) # 2 cores
  registerDoParallel(cl)
  registerDoRNG(12) # Reproducible parallel loops using doRNG
  opt_cut <- cutpointr(suicide, dsi, suicide, gender, pos_class = "yes",
                 direction = ">=", boot_runs = 30, allowParallel = TRUE)
  stopCluster(cl)
  opt_cut
}

## ------------------------------------------------------------------------
set.seed(100)
cutpointr(suicide, dsi, suicide, gender, 
          method = maximize_boot_metric,
          boot_cut = 30, summary_func = mean,
          metric = accuracy, silent = TRUE)

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, gender, method = minimize_metric,
                     metric = misclassification_cost, cost_fp = 1, cost_fn = 10)

## ------------------------------------------------------------------------
plot_metric(opt_cut)

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, gender, 
                     method = minimize_loess_metric,
                     criterion = "aicc", family = "symmetric", 
                     degree = 2, user.span = 0.7,
                     metric = misclassification_cost, cost_fp = 1, cost_fn = 10)

## ------------------------------------------------------------------------
plot_metric(opt_cut)

## ------------------------------------------------------------------------
exdat <- iris
exdat <- exdat[exdat$Species != "setosa", ]
opt_cut <- cutpointr(exdat, Petal.Length, Species,
                     method = minimize_gam_metric,
                     formula = m ~ s(x.sorted, bs = "cr"),
                     metric = abs_d_sens_spec)
plot_metric(opt_cut)
ggplot(opt_cut$roc_curve[[1]] %>% 
           gather(metric, value, m, m_unsmoothed, -x.sorted, na.rm = TRUE),
       aes(x = x.sorted, y = value, color = metric)) + 
    geom_line()

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, gender, 
                     method = minimize_spline_metric, spar = 0.4,
                     metric = misclassification_cost, cost_fp = 1, cost_fn = 10)
plot_metric(opt_cut)

## ------------------------------------------------------------------------
cutpointr(suicide, dsi, suicide, gender, method = oc_youden_normal)

## ------------------------------------------------------------------------
cutpointr(suicide, dsi, suicide, gender, method = oc_youden_kernel)

## ---- fig.width=4, fig.height=3------------------------------------------
roc_curve <- roc(data = suicide, x = "dsi", class = "suicide",
    pos_class = "yes", neg_class = "no")
plot_cutpointr(roc_curve, fpr, tpr, aspect_ratio = 1)

## ------------------------------------------------------------------------
dat <- data.frame(outcome = c("neg", "neg", "neg", "pos", "pos", "pos", "pos"),
                  pred    = c(1, 2, 3, 8, 11, 11, 12))

## ------------------------------------------------------------------------
opt_cut <- cutpointr(dat, x = pred, class = outcome, use_midpoints = TRUE)
plot_x(opt_cut)

## ---- echo = FALSE-------------------------------------------------------
plotdat_nomidpoints <- structure(list(sim_nr = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 4L, 
4L, 4L, 4L, 4L, 4L, 4L, 4L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 5L, 6L, 
6L, 6L, 6L, 6L, 6L, 6L, 6L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 7L, 8L, 
8L, 8L, 8L, 8L, 8L, 8L, 8L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 9L, 10L, 
10L, 10L, 10L, 10L, 10L, 10L, 10L, 11L, 11L, 11L, 11L, 11L, 11L, 
11L, 11L, 12L, 12L, 12L, 12L, 12L, 12L, 12L, 12L, 13L, 13L, 13L, 
13L, 13L, 13L, 13L, 13L, 14L, 14L, 14L, 14L, 14L, 14L, 14L, 14L, 
15L, 15L, 15L, 15L, 15L, 15L, 15L, 15L, 16L, 16L, 16L, 16L, 16L, 
16L, 16L, 16L, 17L, 17L, 17L, 17L, 17L, 17L, 17L, 17L, 18L, 18L, 
18L, 18L, 18L, 18L, 18L, 18L, 19L, 19L, 19L, 19L, 19L, 19L, 19L, 
19L, 20L, 20L, 20L, 20L, 20L, 20L, 20L, 20L, 21L, 21L, 21L, 21L, 
21L, 21L, 21L, 21L, 22L, 22L, 22L, 22L, 22L, 22L, 22L, 22L, 23L, 
23L, 23L, 23L, 23L, 23L, 23L, 23L, 24L, 24L, 24L, 24L, 24L, 24L, 
24L, 24L, 25L, 25L, 25L, 25L, 25L, 25L, 25L, 25L, 26L, 26L, 26L, 
26L, 26L, 26L, 26L, 26L, 27L, 27L, 27L, 27L, 27L, 27L, 27L, 27L, 
28L, 28L, 28L, 28L, 28L, 28L, 28L, 28L, 29L, 29L, 29L, 29L, 29L, 
29L, 29L, 29L, 30L, 30L, 30L, 30L, 30L, 30L, 30L, 30L, 31L, 31L, 
31L, 31L, 31L, 31L, 31L, 31L, 32L, 32L, 32L, 32L, 32L, 32L, 32L, 
32L, 33L, 33L, 33L, 33L, 33L, 33L, 33L, 33L, 34L, 34L, 34L, 34L, 
34L, 34L, 34L, 34L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 35L, 36L, 
36L, 36L, 36L, 36L, 36L, 36L, 36L), method = structure(c(1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 
2L, 3L, 4L, 5L, 6L, 7L, 8L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L), .Label = c("emp", 
"normal", "loess", "boot", "spline", "spline_20", "kernel", "gam"
), class = "factor"), n = c(30, 30, 30, 30, 30, 30, 30, 30, 50, 
50, 50, 50, 50, 50, 50, 50, 75, 75, 75, 75, 75, 75, 75, 75, 100, 
100, 100, 100, 100, 100, 100, 100, 150, 150, 150, 150, 150, 150, 
150, 150, 250, 250, 250, 250, 250, 250, 250, 250, 500, 500, 500, 
500, 500, 500, 500, 500, 750, 750, 750, 750, 750, 750, 750, 750, 
1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 30, 30, 30, 30, 
30, 30, 30, 30, 50, 50, 50, 50, 50, 50, 50, 50, 75, 75, 75, 75, 
75, 75, 75, 75, 100, 100, 100, 100, 100, 100, 100, 100, 150, 
150, 150, 150, 150, 150, 150, 150, 250, 250, 250, 250, 250, 250, 
250, 250, 500, 500, 500, 500, 500, 500, 500, 500, 750, 750, 750, 
750, 750, 750, 750, 750, 1000, 1000, 1000, 1000, 1000, 1000, 
1000, 1000, 30, 30, 30, 30, 30, 30, 30, 30, 50, 50, 50, 50, 50, 
50, 50, 50, 75, 75, 75, 75, 75, 75, 75, 75, 100, 100, 100, 100, 
100, 100, 100, 100, 150, 150, 150, 150, 150, 150, 150, 150, 250, 
250, 250, 250, 250, 250, 250, 250, 500, 500, 500, 500, 500, 500, 
500, 500, 750, 750, 750, 750, 750, 750, 750, 750, 1000, 1000, 
1000, 1000, 1000, 1000, 1000, 1000, 30, 30, 30, 30, 30, 30, 30, 
30, 50, 50, 50, 50, 50, 50, 50, 50, 75, 75, 75, 75, 75, 75, 75, 
75, 100, 100, 100, 100, 100, 100, 100, 100, 150, 150, 150, 150, 
150, 150, 150, 150, 250, 250, 250, 250, 250, 250, 250, 250, 500, 
500, 500, 500, 500, 500, 500, 500, 750, 750, 750, 750, 750, 750, 
750, 750, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000), mean_err = c(0.532157164015659, 
0.0344907054484091, 1.09430750651166, 0.847845162156675, 1.72337372126503, 
0.893756658507988, 0.0430309247027736, 0.785821459035346, 0.368063404388512, 
0.0256197760404459, 0.54480529648463, 0.54385597929651, 0.657325657699579, 
0.578611116865437, 0.0400491342691897, 0.515688005217413, 0.256713912589642, 
0.0444582875885996, 0.326975493112402, 0.371128780921122, 0.473515115741104, 
0.389519558405289, 0.105044360789378, 0.301924717299333, 0.207750921776918, 
-0.00318128936770314, 0.215170156089776, 0.27218780048926, 0.260519564021842, 
0.236792923882582, 0.0209319074923902, 0.232957055204834, 0.0726605917614469, 
-0.00282823355849125, 0.0753216783313991, 0.147121931849656, 
0.0986417724955371, 0.10048009778446, -0.0117861260923649, 0.0650845904350442, 
0.0985144485083747, 0.00601003227249322, 0.107439979908118, 0.120777421732797, 
0.098470489820427, 0.0940946984227826, 0.0340166854141625, 0.107851118082414, 
0.0249685210781582, -0.00275219600614378, 0.0258069390207201, 
0.0303381972274654, -0.000994602151869198, 0.00196854833683764, 
-0.0172319489562159, 0.0230957871932473, 0.00787486424680835, 
-0.018438041997315, -0.000808033567394628, -0.00151904153864496, 
-0.0258118523805697, -0.020984156892953, -0.0411584927473141, 
-0.0462075435919094, 0.0481149217843661, -0.0115241085997692, 
0.0278045708419731, 0.0358588316426625, 0.0424473909450939, 0.0379773233328197, 
0.0298772985879321, 0.0494939492036379, 0.561286668337778, 0.0210874502384648, 
0.607711822769155, 0.944733906256477, 1.32069801051061, 0.623604782428556, 
0.0138075109769806, 0.640859854412358, 0.284873604303057, -0.0170357985365701, 
0.273426417633118, 0.524432737895336, 0.355003110979807, 0.312837607951434, 
-0.0316296929553873, 0.270109834098986, 0.174110335581819, 0.0253101719615279, 
0.199956222742702, 0.375485416120771, 0.278956745944806, 0.244245525945888, 
0.0325126314233263, 0.253352659868514, 0.154840760004461, 0.00231589709639472, 
0.154412480165179, 0.264847742842386, 0.196572744185608, 0.182934783774992, 
0.0207139021497755, 0.17351041376412, 0.14190910348156, -0.000766834484010096, 
0.159975205214477, 0.191222128926019, 0.119768252112669, 0.12033372914036, 
-0.00429047209392067, 0.120982527821078, 0.0756304869484406, 
-0.00890884219048113, 0.0727782693168392, 0.118690444738942, 
0.0814898789647033, 0.0799724348001957, 0.0182926240912726, 0.0887155007804252, 
0.00799604720502299, 0.000599148388616836, -0.00567769035990384, 
0.0358412514670032, 0.0308474979074875, 0.0341668723768997, -0.000180318451026095, 
0.0180733341290925, 0.00456876236626807, 0.00150574966485876, 
0.011152095953916, 0.0176039119729626, 0.00608274255434991, 0.0146257828313115, 
-0.0108877417404102, 0.00341198000323035, -0.00198459880370283, 
0.0026551895445694, 0.00199040664534129, 0.0150165794544221, 
0.00646287144368147, 0.00999205240904708, -0.00850278571195971, 
0.000833666619266177, 0.714730067273087, -0.00916546079360956, 
0.662799490366986, 1.18552468844156, 1.25901933062308, 0.672701515532179, 
0.0311066140197676, 0.699068058809396, 0.451908043813962, 0.0131716226592205, 
0.429551369887738, 0.697928133235757, 0.445367768988423, 0.408463448982185, 
0.0318707241721211, 0.406284953982951, 0.257736307754364, -0.00525924423719458, 
0.236977000055322, 0.429144726596141, 0.291381752107184, 0.267557606428613, 
0.0103657879176852, 0.254728590646094, 0.187783398487578, -0.00216064381479362, 
0.209025103860707, 0.318293592390017, 0.216751610346408, 0.195630579126633, 
-0.00355723971644246, 0.174111826408428, 0.151010324964235, 0.0152409223899092, 
0.159002511320467, 0.214643583389694, 0.136211731513269, 0.138948149207635, 
0.00736196817594524, 0.115637867729083, 0.0491348055596302, -0.00133957946235943, 
0.0507437758212659, 0.103956325245849, 0.0641182216839426, 0.0721933081297794, 
-0.0124376134651938, 0.0632317888879588, 0.0322195712438111, 
0.00170122889182022, 0.0287526766624194, 0.0589662164030242, 
0.0348535721709848, 0.039527944642463, -0.00617539706415593, 
0.0274246010641889, 0.0325877909680824, 0.00530528253248245, 
0.0221776555499961, 0.0389702052631117, 0.0221602091288215, 0.0254478639695596, 
-0.0016189234058987, 0.0197144417326668, -0.00632485262604172, 
-0.00364979854195596, -0.00276076468388984, 0.0126267527301874, 
0.0123592498266038, 0.0154921632247644, -0.00591512196680815, 
0.0098685016547149, 1.19276916750486, -0.0296831640401583, 0.99406393593888, 
1.95758669445116, 1.45842790978446, 0.916899913902239, -0.0240222410217233, 
1.00771193034927, 0.748151091428865, 0.001671855025917, 0.665180535306263, 
1.1777049634557, 0.578603609273264, 0.546625362141714, 0.0292152981607387, 
0.615230814912951, 0.417886753756131, 0.00324593885807739, 0.406076310942717, 
0.732191741449251, 0.352684769616612, 0.326901376027897, -0.000759357576337989, 
0.350075431324921, 0.310927617707656, -0.0107255472998434, 0.28102101085112, 
0.514683023356017, 0.24913510139508, 0.235155452507568, -0.0220885572014814, 
0.243370611433649, 0.209652330609093, -0.00502865663759991, 0.2172246261346, 
0.356540958804122, 0.172121720418057, 0.17487914828986, 0.00365942442127361, 
0.176594681455494, 0.126956927057327, -0.00270525933073803, 0.120116234221594, 
0.210827536708082, 0.101520409193932, 0.101379097920023, 0.00238043252144371, 
0.113027315928011, 0.0598624378953727, -0.00538838415690431, 
0.0568400730102315, 0.0978115258288965, 0.0454207684906316, 0.0473140143579152, 
-0.00165813015281622, 0.0521772135812508, 0.0530224090961669, 
-0.000416993405198653, 0.0353236911458531, 0.0605493601241619, 
0.0316204159297213, 0.0344789374555544, -0.00446984887315054, 
0.0328807595695966, 0.0396438546423947, -0.00331466369719113, 
0.0379029847219126, 0.0572435100638761, 0.0253269328104989, 0.0235663211070417, 
0.00220241478536399, 0.0307132312422208), youden = c(0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 
0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 
0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 
0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 
0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 
0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 
0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8
)), .Names = c("sim_nr", "method", "n", "mean_err", "youden"), row.names = c(NA, 
-288L), vars = "sim_nr", labels = structure(list(sim_nr = 1:36), .Names = "sim_nr", class = "data.frame", row.names = c(NA, 
-36L), vars = "sim_nr"), indices = list(0:7, 8:15, 16:23, 24:31, 
    32:39, 40:47, 48:55, 56:63, 64:71, 72:79, 80:87, 88:95, 96:103, 
    104:111, 112:119, 120:127, 128:135, 136:143, 144:151, 152:159, 
    160:167, 168:175, 176:183, 184:191, 192:199, 200:207, 208:215, 
    216:223, 224:231, 232:239, 240:247, 248:255, 256:263, 264:271, 
    272:279, 280:287), group_sizes = c(8L, 8L, 8L, 8L, 8L, 8L, 
8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 
8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L), biggest_group_size = 8L, class = c("grouped_df", 
"tbl_df", "tbl", "data.frame"))

## ---- echo = FALSE-------------------------------------------------------
ggplot(plotdat_nomidpoints %>% filter(!(method %in% c("spline_20"))), 
       aes(x = n, y = mean_err, color = method, shape = method)) + 
    geom_line() + geom_point() +
    facet_wrap(~ youden, scales = "fixed") +
    scale_shape_manual(values = 1:nlevels(plotdat_nomidpoints$method)) +
    scale_x_log10(breaks = c(30, 50, 75, 100, 150, 250, 500, 750, 1000)) +
    ggtitle("Bias of all methods when use_midpoints = FALSE",
            "normally distributed data, 10000 repetitions of simulation")

## ------------------------------------------------------------------------
opt_cut <- cutpointr(suicide, dsi, suicide, metric = sum_sens_spec, 
                     tol_metric = 0.05)
opt_cut %>% 
    select(optimal_cutpoint, sum_sens_spec) %>% 
    unnest

## ------------------------------------------------------------------------
set.seed(100)
opt_cut_manual <- cutpointr(suicide, dsi, suicide, method = oc_manual, 
                       cutpoint = mean(suicide$dsi), boot_runs = 30)
set.seed(100)
opt_cut_mean <- cutpointr(suicide, dsi, suicide, method = oc_mean, boot_runs = 30)

## ------------------------------------------------------------------------
set.seed(12)
opt_cut <- cutpointr(suicide, log(dsi + 1), suicide == "yes",
    subgroup = dsi %% 2 == 0, boot_runs = 30)
opt_cut
predict(opt_cut, newdata = data.frame(dsi = 0:5))

## ------------------------------------------------------------------------
dat <- iris %>% 
    dplyr::filter(Species %in% c("setosa", "virginica"))

purrr::map_df(colnames(dat)[1:4], function(coln) {
    cutpointr_(dat, x = coln, class = "Species", 
               pos_class = "setosa", use_midpoints = T) %>% 
        mutate(variable = coln)
}) %>% 
    dplyr::select(variable, direction, optimal_cutpoint, AUC)

## ------------------------------------------------------------------------
multi_cutpointr(dat, class = "Species", pos_class = "setosa", 
                use_midpoints = TRUE, silent = TRUE) %>% 
    dplyr::select(variable, direction, optimal_cutpoint, AUC)

## ------------------------------------------------------------------------
# Extracting the bootstrap results
set.seed(123)
opt_cut <- cutpointr(suicide, dsi, suicide, boot_runs = 20)
# Using base R to summarise the result of the first bootstrap
summary(opt_cut$boot[[1]]$optimal_cutpoint)
# Using dplyr
opt_cut %>% 
    select(boot) %>% 
    unnest %>% 
    select(optimal_cutpoint) %>% 
    summary

## ------------------------------------------------------------------------
set.seed(123)
opt_cut <- cutpointr(suicide, dsi, suicide, gender, boot_runs = 20)
opt_cut %>% 
    select(subgroup, boot) %>%
    unnest %>%
    group_by(subgroup) %>%
    summarise(mean_oc = mean(optimal_cutpoint), 
              mean_accuracy = mean(acc_oob))
opt_cut %>%
    select(subgroup, boot) %>% 
    mutate(summary_b = map(boot, function(x) {
        data.frame(min = min(x$optimal_cutpoint),
                   mean = mean(x$optimal_cutpoint),
                   max = max(x$optimal_cutpoint))
    })) %>% 
    select(-boot) %>%
    unnest

## ------------------------------------------------------------------------
cutpointr(suicide, dsi, suicide, gender, metric = youden, silent = TRUE) %>% 
    add_metric(list(ppv, npv)) %>% 
    select(subgroup, optimal_cutpoint, youden, ppv, npv)

## ---- eval = FALSE-------------------------------------------------------
#  mean_cut <- function(data, x, ...) {
#      oc <- mean(data[[x]])
#      return(data.frame(optimal_cutpoint = oc))
#  }

## ------------------------------------------------------------------------
misclassification_cost

## ---- fig.width=4, fig.height=3------------------------------------------
set.seed(102)
opt_cut <- cutpointr(suicide, dsi, suicide, gender, 
                     boot_runs = 50, silent = F, tol_metric = 0.05, metric = accuracy)
opt_cut <- cutpointr(suicide, dsi, suicide, gender, method = minimize_metric,
                     metric = abs_d_sens_spec, boot_runs = 50, silent = TRUE)
opt_cut
plot_cut_boot(opt_cut)
plot_metric(opt_cut, conf_lvl = 0.9)
plot_metric_boot(opt_cut)
plot_precision_recall(opt_cut)
plot_sensitivity_specificity(opt_cut)
plot_roc(opt_cut)

## ---- fig.width=4, fig.height=3------------------------------------------
p <- plot_x(opt_cut)
p + ggtitle("Distribution of dsi") + theme_minimal() + xlab("Depression score")

## ---- fig.width=4, fig.height=3------------------------------------------
set.seed(500)
oc <- cutpointr(suicide, dsi, suicide, boot_runs = 20, 
                metric = sum_ppv_npv) # metric irrelevant for plot_cutpointr
plot_cutpointr(oc, xvar = cutpoints, yvar = sum_sens_spec, conf_lvl = 0.9)
plot_cutpointr(oc, xvar = fpr, yvar = tpr, aspect_ratio = 1, conf_lvl = 0)
plot_cutpointr(oc, xvar = cutpoint, yvar = tp, conf_lvl = 0.9) + geom_point()

## ---- fig.width=4, fig.height=3------------------------------------------
set.seed(123) # Some missing values expected
opt_cut <- cutpointr(suicide, dsi, suicide, gender, boot_runs = 50)
head(opt_cut$data)

opt_cut %>% 
    select(data, subgroup) %>% 
    unnest %>% 
    ggplot(aes(x = suicide, y = dsi)) + 
    geom_boxplot(alpha = 0.3) + facet_grid(~subgroup)

## ---- eval = FALSE-------------------------------------------------------
#  # Return cutpoint that maximizes the sum of sensitivity and specificiy
#  # ROCR package
#  rocr_sensspec <- function(x, class) {
#      pred <- ROCR::prediction(x, class)
#      perf <- ROCR::performance(pred, "sens", "spec")
#      sens <- slot(perf, "y.values")[[1]]
#      spec <- slot(perf, "x.values")[[1]]
#      cut <- slot(perf, "alpha.values")[[1]]
#      cut[which.max(sens + spec)]
#  }
#  
#  # pROC package
#  proc_sensspec <- function(x, class,
#                            levels = c("no", "yes"), algo = 2) {
#      r <- pROC::roc(class, x, algorithm = algo)
#      sens <- r$sensitivities
#      spec <- r$specificities
#      cut <- r$thresholds
#      cut[which.max(sens + spec)]
#  }

## ---- eval = FALSE, echo = FALSE-----------------------------------------
#  library(OptimalCutpoints)
#  library(ThresholdROC)
#  n <- 1000
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  x_pos <- dat$x[dat$y == 1]
#  x_neg <- dat$x[dat$y == 0]
#  bench_1000 <- microbenchmark::microbenchmark(
#      cutpointr(dat, x, y, pos_class = 1, neg_class = 0,
#                direction = ">=", metric = youden, break_ties = mean),
#      rocr_sensspec(dat$x, dat$y),
#      proc_sensspec(dat$x, dat$y, algo = 2),
#      optimal.cutpoints(X = "x", status = "y", tag.healthy = 0, methods = "Youden",
#                        data = dat),
#      thres2(k1 = x_neg, k2 = x_pos, rho = 0.5,
#             method = "empirical", ci = FALSE)
#  )
#  
#  n <- 10000
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  x_pos <- dat$x[dat$y == 1]
#  x_neg <- dat$x[dat$y == 0]
#  bench_10000 <- microbenchmark::microbenchmark(
#      cutpointr(dat, x, y, pos_class = 1, neg_class = 0,
#                direction = ">=", metric = youden, break_ties = mean, silent = TRUE),
#      rocr_sensspec(dat$x, dat$y),
#      optimal.cutpoints(X = "x", status = "y", tag.healthy = 0, methods = "Youden",
#                        data = dat),
#      proc_sensspec(dat$x, dat$y, algo = 2),
#      thres2(k1 = x_neg, k2 = x_pos, rho = 0.5,
#             method = "empirical", ci = FALSE),
#      times = 20
#  )
#  
#  n <- 1e5
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e5 <- microbenchmark::microbenchmark(
#      cutpointr(dat, x, y, pos_class = 1, neg_class = 0,
#                direction = ">=", metric = youden, break_ties = mean),
#      rocr_sensspec(dat$x, dat$y),
#      proc_sensspec(dat$x, dat$y, algo = 2),
#      times = 20
#  )
#  
#  n <- 1e6
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e6 <- microbenchmark::microbenchmark(
#      cutpointr(dat, x, y, pos_class = 1, neg_class = 0,
#                direction = ">=", metric = youden, break_ties = mean),
#      rocr_sensspec(dat$x, dat$y),
#      times = 10
#  )
#  
#  n <- 1e7
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e7 <- microbenchmark::microbenchmark(
#      cutpointr(dat, x, y, pos_class = 1, neg_class = 0,
#                direction = ">=", metric = youden, break_ties = mean),
#      rocr_sensspec(dat$x, dat$y),
#      times = 10, unit = "ms"
#  )
#  
#  results <- rbind(
#      data.frame(time = summary(bench_1000)$median,
#                 solution = summary(bench_1000)$expr,
#                 n = 1000),
#      data.frame(time = summary(bench_10000)$median,
#                 solution = summary(bench_10000)$expr,
#                 n = 10000),
#      data.frame(time = summary(bench_1e5)$median,
#                 solution = summary(bench_1e5)$expr,
#                 n = 1e5),
#      data.frame(time = summary(bench_1e6)$median,
#                 solution = summary(bench_1e6)$expr,
#                 n = 1e6),
#      data.frame(time = summary(bench_1e7)$median,
#                 solution = summary(bench_1e7)$expr,
#                 n = 1e7)
#  )
#  results$solution <- as.character(results$solution)
#  results$solution[grep(pattern = "cutpointr", x = results$solution)] <- "cutpointr"
#  results$solution[grep(pattern = "rocr", x = results$solution)] <- "ROCR"
#  results$solution[grep(pattern = "optimal", x = results$solution)] <- "OptimalCutpoints"
#  results$solution[grep(pattern = "proc", x = results$solution)] <- "pROC"
#  results$solution[grep(pattern = "thres", x = results$solution)] <- "ThresholdROC"

## ---- echo = FALSE-------------------------------------------------------
# dput(results)

results <- structure(list(time = c(8.3344635, 3.0178925, 9.1314925, 56.2119325, 
78.8832165, 13.057035, 11.284935, 5383.765367, 94.4034445, 7930.9735595, 
68.155645, 108.9886265, 1021.0981875, 708.1933595, 1250.4259705, 
5893.323971, 13247.3814165), solution = c("cutpointr", "ROCR", 
"pROC", "OptimalCutpoints", "ThresholdROC", "cutpointr", "ROCR", 
"OptimalCutpoints", "pROC", "ThresholdROC", "cutpointr", "ROCR", 
"pROC", "cutpointr", "ROCR", "cutpointr", "ROCR"), n = c(1000, 
1000, 1000, 1000, 1000, 10000, 10000, 10000, 10000, 10000, 1e+05, 
1e+05, 1e+05, 1e+06, 1e+06, 1e+07, 1e+07)), .Names = c("time", 
"solution", "n"), row.names = c(NA, -17L), class = "data.frame")

## ---- echo = FALSE-------------------------------------------------------
ggplot(results, aes(x = n, y = time, col = solution, shape = solution)) +
    geom_point(size = 3) + geom_line() +
    scale_y_log10(breaks = c(3, 5, 10, 25, 100, 250, 1000, 5000, 1e4, 15000)) +
    scale_x_log10(breaks = c(1000, 1e4, 1e5, 1e6, 1e7)) +
    ggtitle("Benchmark results", "n = 1000, 10000, 1e5, 1e6, 1e7") +
    ylab("Median time (milliseconds, log scale)") + xlab("n (log scale)")

## ---- echo = FALSE-------------------------------------------------------
res_table <- tidyr::spread(results, solution, time)
knitr::kable(res_table)

## ---- eval = FALSE-------------------------------------------------------
#  # ROCR package
#  rocr_roc <- function(x, class) {
#      pred <- ROCR::prediction(x, class)
#      return(NULL)
#  }
#  
#  # pROC package
#  proc_roc <- function(x, class, levels = c("no", "yes"), algo = 2) {
#      r <- pROC::roc(class, x, algorithm = algo)
#      return(NULL)
#  }

## ---- eval = FALSE, echo = FALSE-----------------------------------------
#  n <- 1000
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1000 <- microbenchmark::microbenchmark(unit = "ms",
#      cutpointr::roc(dat, "x", "y", pos_class = 1, neg_class = 0,
#                direction = ">="),
#      rocr_roc(dat$x, dat$y),
#      proc_roc(dat$x, dat$y, algo = 2)
#  )
#  
#  n <- 10000
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_10000 <- microbenchmark::microbenchmark(unit = "ms",
#      cutpointr::roc(dat, "x", "y", pos_class = 1, neg_class = 0,
#                direction = ">="),
#      rocr_roc(dat$x, dat$y),
#      proc_roc(dat$x, dat$y, algo = 2),
#      times = 50
#  )
#  
#  n <- 1e5
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e5 <- microbenchmark::microbenchmark(unit = "ms",
#      cutpointr::roc(dat, "x", "y", pos_class = 1, neg_class = 0,
#                direction = ">="),
#      rocr_roc(dat$x, dat$y),
#      proc_roc(dat$x, dat$y, algo = 2),
#      times = 20
#  )
#  
#  n <- 1e6
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e6 <- microbenchmark::microbenchmark(unit = "ms",
#      cutpointr::roc(dat, "x", "y", pos_class = 1, neg_class = 0,
#                direction = ">="),
#      rocr_roc(dat$x, dat$y),
#      times = 15
#  )
#  
#  n <- 1e7
#  set.seed(123)
#  dat <- data.frame(x = rnorm(n), y = sample(c(0:1), size = n, replace = TRUE))
#  bench_1e7 <- microbenchmark::microbenchmark(
#      cutpointr::roc(dat, "x", "y", pos_class = 1, neg_class = 0,
#                direction = ">="),
#      rocr_roc(dat$x, dat$y),
#      times = 10, unit = "ms"
#  )
#  
#  results <- rbind(
#      data.frame(time = summary(bench_1000)$median,
#                 solution = summary(bench_1000)$expr,
#                 n = 1000),
#      data.frame(time = summary(bench_10000)$median,
#                 solution = summary(bench_10000)$expr,
#                 n = 10000),
#      data.frame(time = summary(bench_1e5)$median,
#                 solution = summary(bench_1e5)$expr,
#                 n = 1e5),
#      data.frame(time = summary(bench_1e6)$median,
#                 solution = summary(bench_1e6)$expr,
#                 n = 1e6),
#      data.frame(time = summary(bench_1e7)$median,
#                 solution = summary(bench_1e7)$expr,
#                 n = 1e7)
#  )
#  results$solution <- as.character(results$solution)
#  results$solution[grep(pattern = "cutpointr", x = results$solution)] <- "cutpointr"
#  results$solution[grep(pattern = "rocr", x = results$solution)] <- "ROCR"
#  results$solution[grep(pattern = "proc", x = results$solution)] <- "pROC"

## ---- echo = FALSE-------------------------------------------------------
# dput(results)

results <- structure(list(time = c(1.3027925, 1.223025, 8.9053195, 2.8894935, 
5.1902165, 81.582236, 28.598465, 59.418236, 968.2270865, 265.087399, 
559.158593, 3218.96599, 6227.157674), solution = c("cutpointr", 
"ROCR", "pROC", "cutpointr", "ROCR", "pROC", "cutpointr", "ROCR", 
"pROC", "cutpointr", "ROCR", "cutpointr", "ROCR"), n = c(1000, 
1000, 1000, 10000, 10000, 10000, 1e+05, 1e+05, 1e+05, 1e+06, 
1e+06, 1e+07, 1e+07)), .Names = c("time", "solution", "n"), row.names = c(NA, 
-13L), class = "data.frame")

## ---- echo = FALSE-------------------------------------------------------
ggplot(results, aes(x = n, y = time, col = solution, shape = solution)) +
    geom_point(size = 3) + geom_line() +
    scale_y_log10(breaks = c(1, 5, 10, 25, 100, 250, 1000, 5000, 1e4, 15000)) +
    scale_x_log10(breaks = c(1000, 1e4, 1e5, 1e6, 1e7)) +
    ggtitle("Benchmark results", "n = 1000, 10000, 1e5, 1e6, 1e7") +
    ylab("Median time (milliseconds, log scale)") + xlab("n (log scale)")

## ---- echo = FALSE-------------------------------------------------------
res_table <- tidyr::spread(results, solution, time)
knitr::kable(res_table)

