library(physiology)


### Name: alveolar_PAO2_mmHg
### Title: alveolar gas equation
### Aliases: alveolar_PAO2_mmHg

### ** Examples

# vary RQ
rq <- seq(0.6, 1.4, 0.05)
plot(rq, alveolar_PAO2_mmHg(rq = rq))

# 100% fi_o2 at typical atmospheric pressure
alveolar_PAO2_mmHg(fi_o2 = 1)

# hyperbaric oxygen at 100%, 2 atmospheres
alveolar_PAO2_mmHg(fi_o2 = 1, Patm_mmHg = 1520)



