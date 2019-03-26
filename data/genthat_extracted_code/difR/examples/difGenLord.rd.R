library(difR)


### Name: difGenLord
### Title: Generalized Lord's chi-squared DIF method
### Aliases: difGenLord plot.GenLord print.GenLord

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender ("Man" or "Woman") and trait
##D  # anger score ("Low" or "High")
##D  group <- rep("WomanLow",nrow(verbal))
##D  group[Anger>20 & Gender==0] <- "WomanHigh"
##D  group[Anger<=20 & Gender==1] <- "ManLow"
##D  group[Anger>20 & Gender==1] <- "ManHigh"
##D 
##D  # New data set
##D  Verbal <- cbind(verbal[,1:24], group)
##D 
##D  # Reference group: "WomanLow"
##D  names <- c("WomanHigh", "ManLow", "ManHigh")
##D 
##D  # Three equivalent settings of the data matrix and the group membership
##D  # 1PL model, "ltm" engine 
##D  r <- difGenLord(Verbal, group = 25, focal.names = names, model = "1PL")
##D  difGenLord(Verbal, group = "group", focal.name = names, model = "1PL")
##D  difGenLord(Verbal[,1:24], group = Verbal[,25], focal.names = names, model = "1PL")
##D 
##D  # 1PL model, "ltm" engine, estimated common discrimination 
##D  r <- difGenLord(Verbal, group = 25, focal.names = names, model = "1PL", discr = NULL)
##D 
##D  # 1PL model, "lme4" engine 
##D  difGenLord(Verbal, group = "group", focal.name = names, model = "1PL", engine = "lme4")
##D 
##D  # With items 1 to 5 set as anchor items
##D  difGenLord(Verbal, group = 25, focal.names = names, model = "1PL", anchor = 1:5)
##D 
##D  # Multiple comparisons adjustment using Benjamini-Hochberg method
##D  difGenLord(Verbal, group = 25, focal.names = names, model = "1PL", p.adjust.method = "BH")
##D 
##D  # With item purification
##D  difGenLord(Verbal, group = 25, focal.names = names, model = "1PL", purify = TRUE)
##D 
##D  # Saving the output into the "GLresults.txt" file (and default path)
##D  r <- difGenLord(Verbal, group = 25, focal.names = names, model = "1PL", 
##D          save.output = TRUE, output = c("GLresults", "default"))
##D 
##D  # Splitting the data into the four subsets according to "group"
##D  data0<-data1<-data2<-data3<-NULL
##D  for (i in 1:nrow(verbal)){
##D   if (group[i]=="WomanLow") data0<-rbind(data0,as.numeric(verbal[i,1:24]))
##D   if (group[i]=="WomanHigh") data1<-rbind(data1,as.numeric(verbal[i,1:24]))
##D   if (group[i]=="ManLow") data2<-rbind(data2,as.numeric(verbal[i,1:24]))
##D   if (group[i]=="ManHigh") data3<-rbind(data3,as.numeric(verbal[i,1:24]))
##D   }
##D 
##D  # Estimation of the item parameters (1PL model)
##D  m0.1PL<-itemParEst(data0, model = "1PL")
##D  m1.1PL<-itemParEst(data1, model = "1PL")
##D  m2.1PL<-itemParEst(data2, model = "1PL")
##D  m3.1PL<-itemParEst(data3, model = "1PL")
##D 
##D  # Merging the item parameters WITHOUT rescaling
##D  irt.noscale<-rbind(m0.1PL,m1.1PL,m2.1PL,m3.1PL)
##D  rownames(irt.noscale)<-rep(colnames(verbal[,1:24]),4)
##D 
##D  # Merging the item parameters WITH rescaling
##D  irt.scale<-rbind(m0.1PL, itemRescale(m0.1PL,m1.1PL),
##D  itemRescale(m0.1PL,m2.1PL) ,itemRescale(m0.1PL,m3.1PL))
##D  rownames(irt.scale)<-rep(colnames(verbal[,1:24]),4)
##D 
##D  # Equivalent calculations
##D  difGenLord(irtParam = irt.noscale, nrFocal = 3, same.scale = FALSE)
##D  difGenLord(irtParam = irt.scale, nrFocal = 3, same.scale = TRUE)
##D 
##D  # With item purification
##D  difGenLord(irtParam = irt.noscale, nrFocal = 3, same.scale = FALSE, purify = TRUE)
##D 
##D  # Graphical devices
##D  plot(r)
##D  plot(r, plot = "itemCurve", item = 1)
##D  plot(r, plot = "itemCurve", item = 6)
##D  plot(r, plot = "itemCurve", item = 6, ref.name = "WomanHigh")
##D 
##D  # Plotting results and saving it in a PDF figure
##D  plot(r, save.plot = TRUE, save.options = c("plot", "default", "pdf"))
##D 
##D  # Changing the path, JPEG figure
##D  path <- "c:/Program Files/"
##D  plot(r, save.plot = TRUE, save.options = c("plot", path, "jpeg"))
## End(Not run)
 


