library(whitening)


### Name: forina1986
### Title: Forina 1986 Wine Data - Extended UCI Wine Data
### Aliases: forina1986
### Keywords: datasets

### ** Examples

# load whitening library
library("whitening")

# load Forina 1986 wine data set
data(forina1986)

table(forina1986$type)
#    Barolo Grignolino    Barbera 
#        59         71         48

dim(forina1986$attrib)
# 178  27

colnames(forina1986$attrib)
# [1] "Alcohol"                      "Sugar-free extract"          
# [3] "Fixed acidity"                "Tartaric acid"               
# [5] "Malic acid"                   "Uronic acids"                
# [7] "pH"                           "Ash"                         
# [9] "Alkalinity of ash"            "Potassium"                   
#[11] "Calcium"                      "Magnesium"                   
#[13] "Phosphate"                    "Chloride"                    
#[15] "Total phenols"                "Flavanoids"                  
#[17] "Nonflavanoid phenols"         "Proanthocyanins"             
#[19] "Color intensity"              "Hue"                         
#[21] "OD280/OD315 of diluted wines" "OD280/OD315 of flavonoids"   
#[23] "Glycerol"                     "2-3-butanediol"              
#[25] "Total nitrogen"               "Proline"                     
#[27] "Methanol"  

# PCA-cor whitened data
Z = whiten(forina1986$attrib, method="PCA-cor") 

wt = as.integer(forina1986$type)
plot(Z[,1], Z[,2], xlab=expression(paste(Z[1])), ylab=expression(paste(Z[2])), 
  main="Forina 1986 Wine Data", sub="PCA-cor Whitening", col=wt, pch=wt+14)
legend("topright", levels(forina1986$type)[1:3], col=1:3, pch=(1:3)+14 )



## relationship to UCI wine data

# UCI wine data is a subset
uciwine.attrib = forina1986$attrib[, c("Alcohol", "Malic acid", "Ash", 
  "Alcalinity of ash", "Magnesium", "Total phenols", "Flavanoids", 
  "Nonflavanoid phenols", "Proanthocyanins", "Color intensity", "Hue", 
  "OD280/OD315 of diluted wines", "Proline")]

# two small differences compared to UCI wine data matrix
uciwine.attrib[172,"Color intensity"]  # 9.9 but 9.899999 in UCI matrix
uciwine.attrib[71,"Hue"] # 0.91 but 0.906 in UCI matrix



