library(biosignalEMG)


### Name: on/off detection quality measures
### Title: Measure the quality of an automatic on/off detection
### Aliases: ANDP MNChPD PCE PR TD
### Keywords: manip

### ** Examples

# Simulate 10 seconds of an EMG
emgx <- syntheticemg(n.length.out = 10000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")

# Detect the phases of activation in emgx
b_bonato <- onoff_bonato(emgx, sigma_n = 0.05, m = 10, minL = 30)
b_singlet <- onoff_singlethres(emgx, t = 0.2)

# Compute the quality measures
qm_bonato <- c(ANDP(b_bonato, emgx$on.off), MNChPD(b_bonato, emgx$on.off), 
    PCE(b_bonato, emgx$on.off), PR(b_bonato, emgx$on.off, t = 10), TD(b_bonato, 
        emgx$on.off, t = 10))

qm_singlet <- c(ANDP(b_singlet, emgx$on.off), MNChPD(b_singlet, emgx$on.off), 
    PCE(b_singlet, emgx$on.off), PR(b_singlet, emgx$on.off, t = 10), TD(b_singlet, 
        emgx$on.off, t = 10))

res <- as.matrix(cbind(qm_bonato, qm_singlet))
rownames(res) <- c("ANDP", "MNChPD", "PCE", "TPR", "FPR", "TD")
print(res)



