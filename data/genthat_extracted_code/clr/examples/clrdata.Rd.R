library(clr)


### Name: clrdata
### Title: Create an object of 'clrdata'
### Aliases: clrdata

### ** Examples

library(clr)
data(gb_load)

clr_load <- clrdata(x = gb_load$ENGLAND_WALES_DEMAND,
                    order_by = gb_load$TIMESTAMP,
                    support_grid = 1:48)

head(clr_load)
dim(clr_load)
summary(clr_load)

matplot(t(clr_load), ylab = 'Daily loads', type = 'l')
lines(colMeans(clr_load, na.rm = TRUE),
      col = 'black', lwd = 2)


clr_weather <- clrdata(x = gb_load$TEMPERATURE,
                       order_by = gb_load$TIMESTAMP,
                       support_grid = 1:48)
summary(clr_weather)
plot(1:48,
     colMeans(clr_weather, na.rm = TRUE),
     xlab = 'Instant', ylab = 'Mean of temperatures',
     type = 'l', col = 'cornflowerblue')



