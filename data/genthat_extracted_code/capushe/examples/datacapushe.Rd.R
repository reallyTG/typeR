library(capushe)


### Name: datacapushe
### Title: datacapushe
### Aliases: datacapushe datapartialcapushe datavalidcapushe bubbles bubble
### Keywords: datasets

### ** Examples

data(datacapushe)
capushe(datacapushe,n=1000)
## BIC, DDSE and Djump all three select the true model
plot(capushe(datacapushe))
## Validation:
data(datapartialcapushe)
capushepartial=capushe(datapartialcapushe)
data(datavalidcapushe)
validation(capushepartial,datavalidcapushe) ## The slope heuristics should not 
## be applied for datapartialcapushe.



