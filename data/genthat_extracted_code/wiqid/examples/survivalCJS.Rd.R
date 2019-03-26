library(wiqid)


### Name: Survival (CJS)
### Title: Survival from recapture data with Cormack-Jolly-Seber (CJS)
###   model
### Aliases: survCJS survCJSaj BsurvCJS

### ** Examples

data(dippers)

DH <- dippers[1:7]  # Extract the detection histories
survCJS(DH)  # the phi(.) p(.) model
survCJS(DH, phi ~ .time)  # the phi(t) p(.) model
df <- data.frame(flood = c(FALSE, TRUE, TRUE, FALSE, FALSE, FALSE))
survCJS(DH, phi ~ flood, data=df)  # the phi(flood) p(.) model
# Including a grouping factor:
survCJS(DH, phi ~ flood*group, data=df, group=dippers$sex)

# With unequal intervals - suppose no data were collected in year 5:
DH1 <- DH[, -5]
survCJS(DH1, phi ~ .time, interval = c(1, 1, 1, 2, 1))

# See also the examples in the dippers help file.



