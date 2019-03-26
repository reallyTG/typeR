library(stranger)


### Name: get_anomalies
### Title: Retrieve anomalies
### Aliases: get_anomalies

### ** Examples

data <- crazyfy(iris[,1:4])
(anom <- get_anomalies(strange(data)))
## Not run: 
##D library(dplyr)
##D ss <- iris %>% select(-Species) %>%
##D  crazyfy() %>%
##D  strange(weird="autoencode") %>%
##D  singularize(methods="norm",stacks="avg")
##D  anom2 <- ss %>% get_anomalies(nmin=2, nmax=4)
##D  ss %>% plot(type="n",score="N_anom_norm_avg",anomaly_id=anom2[1])
## End(Not run)



