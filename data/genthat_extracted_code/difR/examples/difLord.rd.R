library(difR)


### Name: difLord
### Title: Lord's chi-squared DIF method
### Aliases: difLord plot.Lord print.Lord

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal <- verbal[colnames(verbal)!="Anger"]
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  # (1PL model, "ltm" engine) 
##D  r <- difLord(verbal, group = 25, focal.name = 1, model = "1PL")
##D  difLord(verbal, group = "Gender", focal.name = 1, model = "1PL")
##D  difLord(verbal[,1:24], group = verbal[,25], focal.name = 1, model = "1PL")
##D 
##D  # With items 1 to 5 set as anchor items
##D  difLord(verbal, group = 25, focal.name = 1, model = "1PL", anchor = 1:5)
##D 
##D  # Multiple comparisons adjustment of p-values with Benjamini-Hochberg method
##D  difLord(verbal, group = 25, focal.name = 1, model = "1PL", anchor = 1:5, p.adjust.method = "BH")
##D 
##D 
##D  # 1PL model, "lme4" engine 
##D  difLord(verbal, group = 25, focal.name = 1, model = "1PL", engine = "lme4")
##D 
##D  # 2PL model   
##D  difLord(verbal, group = "Gender", focal.name = 1, model = "2PL")
##D 
##D  # 3PL model with all pseudo-guessing parameters constrained to 0.05
##D  difLord(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05)
##D 
##D  # Same models, with item purification 
##D  difLord(verbal, group = 25, focal.name = 1, model = "1PL", purify = TRUE)
##D  difLord(verbal, group = "Gender", focal.name = 1, model = "2PL", purify = TRUE)
##D  difLord(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05,
##D  purify = TRUE)
##D 
##D  # Saving the output into the "LordResults.txt" file (and default path)
##D  r <- difLord(verbal, group = 25, focal.name = 1, model = "1PL",
##D  	    save.output = TRUE, output = c("LordResults","default"))
##D 
##D  # Splitting the data into reference and focal groups
##D  nF<-sum(Gender)
##D  nR<-nrow(verbal)-nF
##D  data.ref<-verbal[,1:24][order(Gender),][1:nR,]
##D  data.focal<-verbal[,1:24][order(Gender),][(nR+1):(nR+nF),]
##D 
##D  ## Pre-estimation of the item parameters (1PL model, "ltm" engine)
##D  item.1PL<-rbind(itemParEst(data.ref, model = "1PL"),
##D  itemParEst(data.focal, model = "1PL"))
##D  difLord(irtParam = item.1PL, same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (1PL model, "lme4" engine)
##D  item.1PL<-rbind(itemParEst(data.ref, model = "1PL", engine = "lme4"),
##D  itemParEst(data.focal, model = "1PL", engine = "lme4"))
##D  difLord(irtParam = item.1PL, same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (2PL model) 
##D  item.2PL<-rbind(itemParEst(data.ref, model = "2PL"),
##D  itemParEst(data.focal, model = "2PL"))
##D  difLord(irtParam = item.2PL, same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (constrained 3PL model)
##D  item.3PL<-rbind(itemParEst(data.ref, model = "3PL", c = 0.05),
##D  itemParEst(data.focal, model = "3PL", c = 0.05))
##D  difLord(irtParam = item.3PL, same.scale = FALSE)
##D 
##D  # Graphical devices
##D  plot(r)
##D  plot(r, plot = "itemCurve", item = 1)
##D  plot(r, plot = "itemCurve", item = 6)
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


