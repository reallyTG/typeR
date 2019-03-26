require(testthat)

allNonKoopmanTypes <- c('delta', 'lrt', 'boot_norm', 'boot_perc', 'boot_basic',
                'boot_stud', 'boot_bca')

# POT and binom for yearly data

context("Testing risk ratio calculations.")

set.seed(1)
n <- 500
y1 <- rnorm(n, 0.25, 1)
y0 <- rnorm(n, 0, 1)

cutoff <- 2

yC <- c(sum(y1 > cutoff), sum(y0 > cutoff))

thr <- 1.4
wh1 <- y1 > thr
wh0 <- y0 > thr
index0 <- index1 <- seq_len(n)
y1e <- y1[wh1]
y0e <- y0[wh0]
index1 <- index1[wh1]
index0 <- index0[wh0]

outb <- calc_riskRatio_binom(yC, rep(n, 2), ciType = c('koopman', allNonKoopmanTypes))
outp <- calc_riskRatio_pot(cutoff, y1e, y0e, threshold1 = thr, nBlocks1 = n,
                           nBlocks2 = n, blockIndex1 = index1, blockIndex2 = index0,
                           ciType = allNonKoopmanTypes)

test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(outb$se_logRiskRatio - outb$se_logRiskRatio_boot)), (.03))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_lrt))), (.02))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_koopman))), (.01))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_boot_norm))), (.1))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_boot_perc))), (.15))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_boot_basic))), (.15))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_boot_stud))), (.05))
})
test_that(paste0("binom RR uncertainty methods"), {
    expect_lt(max(abs(log(outb$ci_riskRatio_delta) - log(outb$ci_riskRatio_boot_bca))), (.25))
})


test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_lrt))), (.05))
})
test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_norm))), (.1))
})
test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_perc))), (.1))
})
test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_basic))), (.1))
})
test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_stud))), (.1))
})
test_that(paste0("POT stationary RR uncertainty methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_bca))), (.2))
})

##  boot getting -Inf for some logReturnProbs so get NaN for boot SE


## repeated sampling evaluation

m <- 300
set.seed(1)

rrp <- se_rrp <- se_rrp_boot <- rep(NA, m)
rrb <- se_rrb <- se_rrb_boot <- rep(NA, m)
ci_rrb_lrt <- ci_rrb_koopman <- ci_rrb_boot_norm <- ci_rrb_boot_perc <-
    ci_rrb_boot_stud <- ci_rrb_boot_basic <- ci_rrb_boot_bca <- matrix(NA, m, 2)
ci_rrp_lrt <- ci_rrp_boot_norm <- ci_rrp_boot_perc <-
    ci_rrp_boot_stud <- ci_rrp_boot_basic <- ci_rrp_boot_bca <- matrix(NA, m, 2)

for( i in 1:m ) {
    set.seed(i)
    n <- 300
    y1 <- rnorm(n, 0.25, 1)
    y0 <- rnorm(n, 0, 1)
    
    cutoff <- 2
    
    yC <- c(sum(y1 > cutoff), sum(y0 > cutoff))

    trueRR <- pnorm(cutoff, .25, 1, lower.tail = FALSE) / 
        pnorm(cutoff, 0, 1, lower.tail = FALSE)
    
    thr <- 1.4
    wh1 <- y1 > thr
    wh0 <- y0 > thr
    y1e <- y1[wh1]
    y0e <- y0[wh0]
    index0 <- index1 <- seq_len(n)
    index1 <- index1[wh1]
    index0 <- index0[wh0]

    outb <- calc_riskRatio_binom(yC, rep(n, 2), ciType = c('koopman', allNonKoopmanTypes))
    outp <- calc_riskRatio_pot(cutoff, y1e, y0e, threshold1 = thr, nBlocks1 = n,
                               nBlocks2 = n, blockIndex1 = index1, blockIndex2 = index0,
                               ciType = allNonKoopmanTypes, bootControl = list(n = 100))
    rrb[i] <- outb$logRiskRatio
    se_rrb[i] <- outb$se_logRiskRatio
    se_rrb_boot[i] <- outb$se_logRiskRatio_boot
    ci_rrb_lrt[i, ] <- outb$ci_riskRatio_lrt
    ci_rrb_koopman[i, ] <- outb$ci_riskRatio_koopman
    ci_rrb_boot_norm[i, ] <- outb$ci_riskRatio_boot_norm
    ci_rrb_boot_perc[i, ] <- outb$ci_riskRatio_boot_perc
    ci_rrb_boot_basic[i, ] <- outb$ci_riskRatio_boot_basic
    ci_rrb_boot_stud[i, ] <- outb$ci_riskRatio_boot_stud
    ci_rrb_boot_bca[i, ] <- outb$ci_riskRatio_boot_bca
    rrp[i] <- outp$logRiskRatio
    se_rrp[i] <- outp$se_logRiskRatio
    se_rrp_boot[i] <- outp$se_logRiskRatio_boot
    ci_rrp_lrt[i, ] <- outp$ci_riskRatio_lrt
    ci_rrp_boot_norm[i, ] <- outp$ci_riskRatio_boot_norm
    ci_rrp_boot_perc[i, ] <- outp$ci_riskRatio_boot_perc
    ci_rrp_boot_basic[i, ] <- outp$ci_riskRatio_boot_basic
    ci_rrp_boot_stud[i, ] <- outp$ci_riskRatio_boot_stud
    ci_rrp_boot_bca[i, ] <- outp$ci_riskRatio_boot_bca
}

covLevel <- 0.95 # one-sided

wh <- rrb < Inf & rrb > 0
sd <- sd(rrb[wh], na.rm = TRUE)
se <- mean(se_rrb[wh], na.rm = TRUE)
test_that(paste0("test delta se(logRR) for binom"), {
    expect_lt(max(abs(sd - se)), .1) 
})
se <- mean(se_rrb_boot[wh], na.rm = TRUE)
test_that(paste0("test boot se(logRR) for binom"), {
    expect_lt(max(abs(sd - se)), .1) 
})
wh <- !is.na(rrp)
sd <- sd(rrp[wh], na.rm = TRUE)
se <- mean(se_rrp[wh], na.rm = TRUE)
test_that(paste0("test delta se(logRR) for POT"), {
    expect_lt(max(abs(sd - se)), (.02)) 
})
se <- mean(se_rrp_boot[wh], na.rm = TRUE)
test_that(paste0("test boot se(logRR) for POT"), {
    expect_lt(max(abs(sd - se)), (.05)) 
})

test_that(paste0("test lower LRT CI for binom"), {
    expect_lt(abs(mean(trueRR > ci_rrb_lrt[ , 1]) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for binom"), {
    expect_lt(abs(mean(trueRR < ci_rrb_lrt[ , 2]) - covLevel), 0.03)})
test_that(paste0("test lower Koopman CI for binom"), {
    expect_lt(abs(mean(trueRR > ci_rrb_koopman[ , 1]) - covLevel), 0.03)})
test_that(paste0("test upper Koopman CI for binom"), {
    expect_lt(abs(mean(trueRR < ci_rrb_koopman[ , 2]) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_norm"), {
    expect_lt(abs(mean(trueRR > ci_rrb_boot_norm[ , 1]) - covLevel), 0.06)})
test_that(paste0("test upper LRT CI for boot_norm"), {
    expect_lt(abs(mean(trueRR < ci_rrb_boot_norm[ , 2]) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_perc"), {
    expect_lt(abs(mean(trueRR > ci_rrb_boot_perc[ , 1]) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for boot_perc"), {
    expect_lt(abs(mean(trueRR < ci_rrb_boot_perc[ , 2]) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_basic"), {
    expect_lt(abs(mean(trueRR > ci_rrb_boot_basic[ , 1]) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for boot_basic"), {
    expect_lt(abs(mean(trueRR < ci_rrb_boot_basic[ , 2]) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_stud"), {
    expect_lt(abs(mean(trueRR > ci_rrb_boot_stud[ , 1]) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for boot_stud"), {
    expect_lt(abs(mean(trueRR < ci_rrb_boot_stud[ , 2]) - covLevel), 0.04)})
test_that(paste0("test lower LRT CI for boot_bca"), {
    expect_lt(abs(mean(trueRR > ci_rrb_boot_bca[ , 1]) - covLevel), 0.05)})
test_that(paste0("test upper LRT CI for boot_bca"), {
    expect_lt(abs(mean(trueRR < ci_rrb_boot_bca[ , 2]) - covLevel), 0.03)})
   
test_that(paste0("test lower LRT CI for binom"), {
    expect_lt(abs(mean(trueRR > ci_rrp_lrt[ , 1], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for binom"), {
    expect_lt(abs(mean(trueRR < ci_rrp_lrt[ , 2], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_norm"), {
    expect_lt(abs(mean(trueRR > ci_rrp_boot_norm[ , 1], na.rm = TRUE) - covLevel), 0.06)})
test_that(paste0("test upper LRT CI for boot_norm"), {
    expect_lt(abs(mean(trueRR < ci_rrp_boot_norm[ , 2], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_perc"), {
    expect_lt(abs(mean(trueRR > ci_rrp_boot_perc[ , 1], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for boot_perc"), {
    expect_lt(abs(mean(trueRR < ci_rrp_boot_perc[ , 2], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_basic"), {
    expect_lt(abs(mean(trueRR > ci_rrp_boot_basic[ , 1], na.rm = TRUE) - covLevel), 0.05)})
test_that(paste0("test upper LRT CI for boot_basic"), {
    expect_lt(abs(mean(trueRR < ci_rrp_boot_basic[ , 2], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_stud"), {
    expect_lt(abs(mean(trueRR > ci_rrp_boot_stud[ , 1], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test upper LRT CI for boot_stud"), {
    expect_lt(abs(mean(trueRR < ci_rrp_boot_stud[ , 2], na.rm = TRUE) - covLevel), 0.03)})
test_that(paste0("test lower LRT CI for boot_bca"), {
    expect_lt(abs(mean(trueRR > ci_rrp_boot_bca[ , 1], na.rm = TRUE) - covLevel), 0.04)})
test_that(paste0("test upper LRT CI for boot_bca"), {
    expect_lt(abs(mean(trueRR < ci_rrp_boot_bca[ , 2], na.rm = TRUE) - covLevel), 0.03)})
          


set.seed(1)
cutoff <- 3

nT <- 300
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.97)
wh <- y > thr
yExc <- y[wh]
grps <- grps[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

yC <- c(sum(y[grps == 1] > cutoff), sum(y[grps==2] > cutoff))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

w <- rnorm(nT/2)
z <- rnorm(nT/2)

wNew = c(.001, -.001)
zNew = c(.001, -.001)

weights1 = runif(nT/2, 0.5, 1.5)
weights2 = runif(nT/2, 0.5, 1.5)
pm1 = runif(nT/2, 0, 0.3)
pm2 = runif(nT/2, 0, 0.3)

outg <- calc_riskRatio_gev(yMax[yrgrps == 2], yMax[yrgrps == 1], x1 = data.frame(w = w),
                   x2 = data.frame(w= w, z = z),
                   locationFun1 = ~ w, scaleFun1 = ~w, shapeFun1 = ~1,
                   locationFun2 = ~ w+z, scaleFun2 = ~w+z, shapeFun2 = ~w+z,
                   xNew1 = data.frame(w = wNew), xNew2 = data.frame(w = wNew, z = zNew),
                   returnValue = cutoff, ciType = allNonKoopmanTypes,
                   optimArgs = list(method = 'BFGS'))

test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_lrt))), (.03))
})
test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_norm))), (.5))
})
test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_perc))), (.5))
})
test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_stud))), (.5))
})
test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_basic))), (.5))
})
test_that(paste0("GEV nonstationary RR methods"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_bca))), (.4))
})

outg <- calc_riskRatio_gev(yMax[yrgrps == 2], yMax[yrgrps == 1], x1 = NULL, x2 = data.frame(z = z),
                   locationFun1 = ~ 1, scaleFun1 = ~1, shapeFun1 = ~1,
                   locationFun2 = ~ z, scaleFun2 = ~z, shapeFun2 = ~z,
                   xNew1 = NULL, xNew2 = data.frame(z = zNew[1]),
                   returnValue = cutoff, ciType = allNonKoopmanTypes)

test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta)- log(outg$ci_riskRatio_lrt))), (.1))
})
test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_norm))), (.25))
})
test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_perc))), (.25))
})
test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_stud))), (.25))
})
test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_basic))), (.25))
})
test_that(paste0("GEV nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outg$ci_riskRatio_delta) - log(outg$ci_riskRatio_boot_bca))), (.25))
})

outp <- calc_riskRatio_pot(returnValue = cutoff, yExc[grps == 1], yExc[grps == 2],
                   x1 = data.frame(w = w), x2 = data.frame(w= w, z = z), nBlocks1 = nT/2, nBlocks2 = nT/2,
                   blockIndex1 = blockIndexObs[grps == 1], blockIndex2 = blockIndexObs[grps==2]-(nT/2),
                   threshold1 = thr, 
                   locationFun1 = ~ w, scaleFun1 = ~w, shapeFun1 = ~1,
                   locationFun2 = ~ w+z, scaleFun2 = ~w+z, shapeFun2 = ~w+z,
                   xNew1 = data.frame(w = wNew), xNew2 = data.frame(w = wNew, z = zNew),
                   ciType = allNonKoopmanTypes,
                   optimArgs = list(method = 'BFGS'))


test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_lrt))), (.03))
})
test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_norm))), (.2))
})
test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_perc))), (.2))
})
test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_basic))), (.2))
})
test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_stud))), (.1))
})
test_that(paste0("POT nonstationary RR methods"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_bca))), (.5))
})


outp <- calc_riskRatio_pot(returnValue = cutoff, yExc[grps == 1], yExc[grps == 2],
                   x1 = NULL, x2 = data.frame(w= w, z = z), nBlocks1 = nT/2, nBlocks2 = nT/2,
                   blockIndex1 = blockIndexObs[grps == 1], blockIndex2 = blockIndexObs[grps==2]-(nT/2),
                   threshold1 = thr, 
                   locationFun1 = ~ 1, scaleFun1 = ~1, shapeFun1 = ~1,
                   locationFun2 = ~ w+z, scaleFun2 = ~w+z, shapeFun2 = ~w+z,
                   xNew1 = NULL, xNew2 = data.frame(w = wNew[1], z = zNew[1]),
                   ciType = allNonKoopmanTypes,
                   optimArgs = list(method = 'BFGS'))

test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta)- log(outp$ci_riskRatio_lrt))), (.03))
})
test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_norm))), (.1))
})
test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_perc))), (.1))
})
test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_basic))), (.1))
})
test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_stud))), (.15))
})
test_that(paste0("POT nonstationary RR methods, one stationary"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_bca))), (.15))
})


## with proportionMissing, weights
outp <- calc_riskRatio_pot(yExc[grps == 1], yExc[grps == 2],
                   x1 = NULL, x2 = data.frame(w= w, z = z), nBlocks1 = nT/2, nBlocks2 = nT/2,
                   blockIndex1 = blockIndexObs[grps == 1], blockIndex2 = blockIndexObs[grps==2]-(nT/2),
                   threshold1 = thr, weights1 = weights1, weights2 = weights2,
                   proportionMissing1 = pm1, proportionMissing2 = pm2,
                   locationFun1 = ~ 1, scaleFun1 = ~1, shapeFun1 = ~1,
                   locationFun2 = ~ w+z, scaleFun2 = ~w+z, shapeFun2 = ~w+z,
                   xNew1 = NULL, xNew2 = data.frame(w = wNew[1], z = zNew[1]),
                   returnValue = cutoff, ciType = allNonKoopmanTypes,
                   optimArgs = list(method = 'BFGS'))

test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_lrt))), (.03))
})
test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_norm))), (.15))
})
test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_perc))), (.1))
})
test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_basic))), (.1))
})
test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_stud))), (.07))
})
test_that(paste0("POT nonstationary RR methods, one stationary, proportionMissing, weights"), {
    expect_lt(max(abs(log(outp$ci_riskRatio_delta) - log(outp$ci_riskRatio_boot_bca))), (.35))
})


