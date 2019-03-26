library(REPTILE)


### Name: rsd
### Title: REPTILE sample data (rsd)
### Aliases: rsd
### Keywords: dataset

### ** Examples

## Visualizing rsd data
library("REPTILE")
data(rsd)

## Epigenomic signature of query region grouped by labels
ind_pos = rsd$training_data$region_label == 1
pos_region = rsd$training_data$region_epimark[ind_pos,]
neg_region = rsd$training_data$region_epimark[!ind_pos,]

## Epigenomic signature of DMRs grouped by labels
ind_pos = rsd$training_data$DMR_label == 1
pos_DMR = rsd$training_data$DMR_epimark[ind_pos,]
neg_DMR = rsd$training_data$DMR_epimark[!ind_pos,]

## Prepare the data format required for plotting
n = ncol(rsd$training_data$DMR_epimark) ## Number of features
feature_data_DMR = list()
feature_data_region = list()
for(i in 1:n){
    feature_data_DMR <- append(feature_data_DMR,
                               list(neg_DMR[,i],pos_DMR[,i],
                                    NA,NA))
    feature_data_region <- append(feature_data_region,
                                  list(neg_region[,i],pos_region[,i],
                                       NA,NA))
}

## Plot the feature distribution
par(mar=c(4,8,4,4))
## - query region
b <- boxplot(feature_data_region,
             xlab = "feature value",
             notch=TRUE,outline=FALSE,yaxt='n',
             xlim = c(1,n*4-2),ylim=c(-7,7),
             horizontal=TRUE,
             col=c(rgb(65,105,225,max=255),rgb(250,128,114,max=255)),
             main = "Feature value distribution in query regions"
             )
text(par("usr")[1]-0.2, seq(1.5,n*4-2,by=4),
     labels=gsub("_","-",colnames(rsd$training_data$region_epimark)),
     xpd = TRUE,adj=1)
legend(-8,4*n+4,c("negative","enhancer"),ncol=2,
       fill = c(rgb(250,128,114,max=255),rgb(65,105,225,max=255)),
       xpd=TRUE,bty='n')

## - DMR
b <- boxplot(feature_data_DMR,
             xlab = "feature value",
             notch=TRUE,outline=FALSE,yaxt='n',
             xlim = c(1,n*4-2),ylim=c(-7,7),
             horizontal=TRUE,
             col=c(rgb(65,105,225,max=255),rgb(250,128,114,max=255)),
             main = "Feature value distribution in DMRs"
             )
text(par("usr")[1]-0.2, seq(1.5,n*4-2,by=4),
     labels=gsub("_","-",colnames(rsd$training_data$DMR_epimark)),
     xpd = TRUE,adj=1)
legend(-8,4*n+4,c("negative","enhancer"),ncol=2,
       fill = c(rgb(250,128,114,max=255),rgb(65,105,225,max=255)),
       xpd=TRUE,bty='n')



