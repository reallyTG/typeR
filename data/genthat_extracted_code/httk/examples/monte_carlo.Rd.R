library(httk)


### Name: monte_carlo
### Title: Monte Carlo for pharmacokinetic models
### Aliases: monte_carlo
### Keywords: Monte Carlo

### ** Examples

#Example from httk jss paper:
## Not run: 
##D library(ggplot2)
##D library(scales)
##D vary.params <- NULL
##D params <- parameterize_pbtk(chem.name = "Zoxamide")
##D for(this.param in names(subset(params,
##D names(params) != "Funbound.plasma"))) vary.params[this.param] <- .2
##D censored.params <- list(Funbound.plasma = list(cv = 0.2, lod = 0.01))
##D set.seed(1)
##D out <- monte_carlo(params, cv.params = vary.params,
##D censored.params = censored.params, return.samples = T,
##D model = "pbtk", suppress.messages = T)
##D zoxamide <- ggplot(as.data.frame(out), aes(out)) +
##D geom_histogram(fill="blue", binwidth=1/6) + scale_x_log10() +
##D ylab("Number of Samples") + xlab("Steady State Concentration (uM)") +
##D theme(axis.text = element_text(size = 16),
##D axis.title = element_text(size = 16))
##D print(zoxamide)
##D 
##D 
##D # Fig 1 in Wambaugh et al. (2015) SimCYP vs. our predictions:
##D 
##D vary.params <- list(BW=0.3)
##D vary.params[["Vliverc"]]<-0.3
##D vary.params[["Qgfrc"]]<-0.3
##D vary.params[["Qtotal.liverc"]]<-0.3
##D vary.params[["million.cells.per.gliver"]]<-0.3
##D vary.params[["Clint"]]<-0.3
##D censored.params<-list(Funbound.plasma=list(cv=0.3,lod=0.01))
##D 
##D pValues <- get_cheminfo(c("Compound","CAS","Clint.pValue"))
##D pValues.rat <- get_cheminfo(c("Compound","CAS","Clint.pValue"),species="Rat")
##D 
##D 
##D  
##D Wetmore.table <- NULL
##D for (this.CAS in get_cheminfo(model="3compartmentss")){
##D   if (this.CAS %in% get_wetmore_cheminfo()){
##D     print(this.CAS)
##D     these.params <- parameterize_steadystate(chem.cas=this.CAS)
##D     if (these.params[["Funbound.plasma"]] == 0.0) 
##D     {
##D       these.params[["Funbound.plasma"]] <- 0.005
##D     }
##D     these.params[["Fhep.assay.correction"]] <- 1
##D     vLiver.human.values <- monte_carlo(these.params,
##D                                        cv.params=vary.params,
##D                                        censored.params=censored.params,
##D                                        which.quantile=c(0.05,0.5,0.95),
##D                                        output.units="mg/L",
##D                                        model='3compartmentss',
##D                                        suppress.messages=T,
##D                                        well.stirred.correction=F,
##D                                        Funbound.plasma.correction=F)
##D     percentiles <- c("5","50","95")
##D     for (this.index in 1:3)
##D     {
##D       this.row <- as.data.frame(get_wetmore_css(chem.cas=this.CAS,
##D                                 which.quantile=as.numeric(percentiles[this.index])/100))
##D       this.row <- cbind(this.row, as.data.frame(vLiver.human.values[this.index]))
##D       this.row <- cbind(this.row, as.data.frame(percentiles[this.index]))
##D       this.row <- cbind(this.row, as.data.frame("Human"))
##D       this.row <- cbind(this.row, as.data.frame(this.CAS))
##D       this.row <- cbind(this.row, as.data.frame(pValues[pValues$CAS==this.CAS,
##D                                                 "Human.Clint.pValue"]<0.05))
##D       colnames(this.row) <- c("Wetmore", "Predicted", "Percentile", "Species",
##D                               "CAS", "Systematic")
##D       if (is.na(this.row["Systematic"])) this.row["Systematic"] <- F
##D       Wetmore.table <- Wetmore.table <- rbind(Wetmore.table,this.row)
##D     }
##D   }
##D }
##D 
##D scientific_10 <- function(x) {
##D   out <- gsub("1e", "10^", scientific_format()(x))
##D   out <- gsub("\+","",out)
##D   out <- gsub("10\^01","10",out)
##D   out <- parse(text=gsub("10\^00","1",out))
##D }
##D 
##D 
##D Fig1 <- ggplot(Wetmore.table, aes(Predicted,Wetmore,group = CAS)) +
##D   geom_line() +
##D   geom_point(aes(colour=factor(Percentile),shape=factor(Percentile))) +
##D   scale_colour_discrete(name="Percentile") +
##D   scale_shape_manual(name="Percentile", values=c("5"=21, "50"=22,"95"=24)) +
##D   scale_x_log10(expression(paste(C[ss]," Predicted (mg/L) with Refined Assumptions")),
##D                 label=scientific_10) + 
##D   scale_y_log10(expression(paste(C[ss]," Wetmore ",italic("et al.")," (2012) (mg/L)")),
##D                 label=scientific_10) +
##D   geom_abline(intercept = 0, slope = 1,linetype="dashed")+
##D   theme_bw()+
##D   theme(legend.position="bottom", text  = element_text(size=18))
##D 
##D print(Fig1)
##D 
##D Fig1a.fit <- lm(log(Wetmore) ~ log(Predicted)*Percentile, Wetmore.table)
##D ## End(**Not run**)
## End(Not run)



