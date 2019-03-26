library(caffsim)


### Name: caffDescstat
### Title: Calculate descriptive statistics of simulated PK parameters
### Aliases: caffDescstat

### ** Examples

caffDescstat(caffPkparam(20,500))
caffDescstat(caffPkparamMulti(20,500))
caffDescExample <- cbind(caffDescstat(caffPkparam(20,500)), 
                         caffDescstat(caffPkparam(50,500))[,2])
colnames(caffDescExample)[2:3] <- c('20 kg', '50 kg')      
caffDescExample



