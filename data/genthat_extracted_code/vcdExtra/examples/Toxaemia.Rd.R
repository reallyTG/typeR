library(vcdExtra)


### Name: Toxaemia
### Title: Toxaemia Symptoms in Pregnancy
### Aliases: Toxaemia
### Keywords: datasets

### ** Examples

data(Toxaemia)

tox.tab <- xtabs(Freq~class+smoke+hyper+urea,Toxaemia)
ftable(tox.tab, row.vars=1)


# symptoms by smoking
mosaic(~smoke+hyper+urea, data=tox.tab, shade=TRUE)

# symptoms by social class
mosaic(~class+hyper+urea, data=tox.tab, shade=TRUE)

# predictors
mosaic(~smoke+class, data=tox.tab, shade=TRUE)

# responses
mosaic(~hyper+urea, data=tox.tab, shade=TRUE)

# log odds ratios for urea and hypertension, by class and smoke
## Not run: 
##D LOR <-loddsratio(aperm(tox.tab))
##D LOR
## End(Not run)




