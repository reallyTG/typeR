library(sprex)


### Name: ACE
### Title: Number of Unobserved Species
### Aliases: ACE Chao1 Clench Swor1 f0 iChao1 jack1 jack2

### ** Examples

data(osa.second.growth)
f <- expand.freqs(osa.second.growth)

ace.est <- ACE(f)
chao1.est <- Chao1(f)
jack1.est <- jack1(f)
jack2.est <- jack2(f)
swor1.est <- Swor1(f, 20000)
ichao1.est <- iChao1(f)
clench.est <- Clench(f, num.reps = 50)

f0.est <- cbind(
  ACE = ace.est["f0"],
  Chao1 = chao1.est["f0"],
  jack1 = jack1.est["f0"],
  jack2 = jack2.est["f0"],
  Swor1 = swor1.est["f0"],
  iChao1 = ichao1.est["f0"],
  clench = clench.est["f0"]
)
f0.est




