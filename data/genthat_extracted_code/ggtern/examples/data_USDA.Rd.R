library(ggtern)


### Name: data_USDA
### Title: USDA Textural Classification Data
### Aliases: data_USDA USDA

### ** Examples

#Load the Libraries
library(ggtern)
library(plyr)

#Load the Data.
data(USDA)

#Put tile labels at the midpoint of each tile.
USDA.LAB <- ddply(USDA,"Label",function(df){
  apply(df[,1:3],2,mean)
})

#Tweak
USDA.LAB$Angle = sapply(as.character(USDA.LAB$Label),function(x){
    switch(x,"Loamy Sand"=-35,0)
})

#Construct the plot.
ggtern(data=USDA,aes(Sand,Clay,Silt,color=Label,fill=Label)) +
  geom_polygon(alpha=0.75,size=0.5,color="black") +
  geom_mask() +  
  geom_text(data=USDA.LAB,aes(label=Label,angle=Angle),color="black",size=3.5) +
  theme_rgbw() + 
  theme_showsecondary() +
  theme_showarrows() +
  weight_percent() + 
  guides(fill='none') + 
  theme_legend_position("topleft") + 
  labs(title = "USDA Textural Classification Chart",
       fill  = "Textural Class",
       color = "Textural Class")



