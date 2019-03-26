library(bamboo)


### Name: bamboo.estimate
### Title: Bayesian Model of Protein Primary Sequence for Secondary
###   Structure Prediction
### Aliases: bamboo.estimate bamboo.likelihood bamboo.priorNonInfo
###   bamboo.priorMSA plot.bamboo.estimate bamboo

### ** Examples

data(bamboo.training,
     bamboo.validation.casp9,
     bamboo.validation.astral30,
     bamboo.MSA.casp9,
     bamboo.MSA.astral30)

## No test: 
## Be patient, this example can take several seconds on a fast computer.
likelihood <- bamboo.likelihood(bamboo.training[,"primary"],bamboo.training[,"hetc"],force=TRUE)

prior.NonInfo <- bamboo.priorNonInfo()
bamboo.MSA <- c(bamboo.MSA.casp9,bamboo.MSA.astral30)

target <- "f3rvca_0"
aa <- bamboo.validation.astral30[bamboo.validation.astral30$name==target,"primary"]
fm.NonInfo <- bamboo.estimate(likelihood(aa),prior.NonInfo,5000,500)
fm.MSA     <- bamboo.estimate(likelihood(aa),bamboo.priorMSA(bamboo.MSA[[target]]),5000,500)

ss <- c(
  "Truth"=bamboo.validation.astral30[bamboo.validation.astral30$name==target,"hetc"],
  "NonInfo-MP"=fm.NonInfo$mpState,
  "MSA-MP"=fm.MSA$mpState
)
plot(fm.MSA,ss)
## End(No test)

## Don't show: 
rscala::scalaDisconnect(bamboo:::s)
## End(Don't show)



