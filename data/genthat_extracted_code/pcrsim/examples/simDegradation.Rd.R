library(pcrsim)


### Name: simDegradation
### Title: DNA Degradation Simulator
### Aliases: simDegradation

### ** Examples

# Simulate profile.
# Get allele frequency database.
require(strvalidator)
db <- strvalidator::getDb(getDb()[2])
# Simulate profile.
res <- simProfile(kit= "ESX17", db=db, sim=10, name="Test")
# Simulate sample.
res <- simSample(data=res, cells=5000)
# Simulate degradation.
res <- simDegradation(data=res, kit="ESX17", deg=0.03, quant.target=80)
print(res)



