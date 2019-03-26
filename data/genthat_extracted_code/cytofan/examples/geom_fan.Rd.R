library(cytofan)


### Name: geom_fan
### Title: Fan plots for trend and population visualizations
### Aliases: geom_fan stat_fan

### ** Examples

# reformat dataset from short-wide to tall-skinny
EuStockMarkets_ts <- lapply(colnames(EuStockMarkets),function(id) {
  data.frame(id=id,value=as.numeric(EuStockMarkets[,id]))
})
EuStockMarkets_ts <- do.call('rbind',EuStockMarkets_ts)

# plot the distribution of the different stock markets
ggplot(EuStockMarkets_ts,aes(x=id,y=value))+
  geom_fan()

# Change the step
ggplot(EuStockMarkets_ts,aes(x=id,y=value))+
  geom_fan(step=0.05)

# change the default color
ggplot(EuStockMarkets_ts,aes(x=id,y=value))+
  geom_fan(colorbase='Greens')

# any valid RColorBrewer palette will work
ggplot(EuStockMarkets_ts,aes(x=id,y=value))+
  geom_fan(colorbase='RdYlGn')




