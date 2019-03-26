library(difR)


### Name: difRaju
### Title: Raju's area DIF method
### Aliases: difRaju plot.Raj print.Raj

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal<-verbal[colnames(verbal)!="Anger"]
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  # (1PL model, "ltm" engine) 
##D  difRaju(verbal, group = 25, focal.name = 1, model = "1PL")
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "1PL")
##D  difRaju(verbal[,1:24], group = verbal[,25], focal.name = 1, model = "1PL")
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difRaju(verbal, group = 25, focal.name = 1, model = "1PL", p.adjust.method = "BH")
##D 
##D  # With signed areas
##D  difRaju(verbal, group = 25, focal.name = 1, model = "1PL", signed = TRUE)
##D 
##D  # With items 1 to 5 set as anchor items
##D  difRaju(verbal, group = 25, focal.name = 1, model = "1PL", anchor = 1:5)
##D 
##D  # (1PL model, "lme4" engine) 
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "1PL",
##D  engine = "lme4")
##D 
##D  # 2PL model, signed and unsigned areas
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "2PL")
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "2PL", signed = TRUE)
##D 
##D  # 3PL model with all pseudo-guessing parameters constrained to 0.05
##D  # Signed and unsigned areas
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05)
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05,
##D    signed = TRUE)
##D  
##D  # Same models, with item purification
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "1PL", purify = TRUE)
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "2PL", purify = TRUE)
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05,
##D  purify = TRUE)
##D 
##D  # With signed areas
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "1PL", purify = TRUE,
##D    signed = TRUE)
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "2PL", purify = TRUE,
##D    signed = TRUE)
##D  difRaju(verbal, group = "Gender", focal.name = 1, model = "3PL", c = 0.05,
##D  purify = TRUE, signed = TRUE)
##D 
##D  ## Splitting the data into reference and focal groups
##D  nF<-sum(Gender)
##D  nR<-nrow(verbal)-nF
##D  data.ref<-verbal[,1:24][order(Gender),][1:nR,]
##D  data.focal<-verbal[,1:24][order(Gender),][(nR+1):(nR+nF),]
##D 
##D  ## Pre-estimation of the item parameters (1PL model, "ltm" engine)
##D  item.1PL<-rbind(itemParEst(data.ref,model = "1PL"),
##D  itemParEst(data.focal,model = "1PL"))
##D  difRaju(irtParam = item.1PL,same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (1PL model, "lme4" engine)
##D  item.1PL<-rbind(itemParEst(data.ref, model = "1PL", engine = "lme4"),
##D  itemParEst(data.focal, model = "1PL", engine = "lme4"))
##D  difRaju(irtParam = item.1PL, same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (2PL model)
##D  item.2PL<-rbind(itemParEst(data.ref, model = "2PL"),
##D  itemParEst(data.focal, model = "2PL"))
##D  difRaju(irtParam = item.2PL, same.scale = FALSE)
##D 
##D  ## Pre-estimation of the item parameters (constrained 3PL model)
##D  item.3PL<-rbind(itemParEst(data.ref, model = "3PL", c = 0.05),
##D  itemParEst(data.focal, model = "3PL", c = 0.05))
##D  difRaju(irtParam = item.3PL, same.scale = FALSE)
##D 
##D  # Saving the output into the "RAJUresults.txt" file (and default path)
##D  r <- difRaju(verbal, group = 25, focal.name = 1, model = "1PL",
##D           save.output = TRUE, output = c("RAJUresults","default"))
##D 
##D  # Graphical devices
##D  plot(r)
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


