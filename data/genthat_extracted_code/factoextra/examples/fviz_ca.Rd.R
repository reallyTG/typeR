library(factoextra)


### Name: fviz_ca
### Title: Visualize Correspondence Analysis
### Aliases: fviz_ca fviz_ca_row fviz_ca_col fviz_ca_biplot fviz_ca

### ** Examples

# Correspondence Analysis
# ++++++++++++++++++++++++++++++
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")

library("FactoMineR")
data(housetasks)
head(housetasks)
res.ca <- CA(housetasks, graph=FALSE)

# Biplot of rows and columns
# ++++++++++++++++++++++++++
# Symetric Biplot of rows and columns
fviz_ca_biplot(res.ca)

# Asymetric biplot, use arrows for columns
fviz_ca_biplot(res.ca, map ="rowprincipal",
 arrow = c(FALSE, TRUE))
 
# Keep only the labels for row points
fviz_ca_biplot(res.ca, label ="row")

# Keep only labels for column points
fviz_ca_biplot(res.ca, label ="col")

       
# Select the top 7 contributing rows
# And the top 3 columns
fviz_ca_biplot(res.ca,  
               select.row = list(contrib = 7),
               select.col = list(contrib = 3))

# Graph of row variables
# +++++++++++++++++++++
   
# Control automatically the color of row points
   # using the "cos2" or the contributions "contrib"
   # cos2 = the quality of the rows on the factor map
   # Change gradient color
   # Use repel = TRUE to avoid overplotting (slow if many points)
fviz_ca_row(res.ca, col.row = "cos2",
   gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
   repel = TRUE)

# You can also control the transparency 
# of the color by the "cos2" or "contrib"
fviz_ca_row(res.ca, alpha.row="contrib") 
      
# Select and visualize some rows with select.row argument.
 # - Rows with cos2 >= 0.5: select.row = list(cos2 = 0.5)
 # - Top 7 rows according to the cos2: select.row = list(cos2 = 7)
 # - Top 7 contributing rows: select.row = list(contrib = 7)
 # - Select rows by names: select.row = list(name = c("Breakfeast", "Repairs", "Holidays"))
 
 # Example: Select the top 7 contributing rows
fviz_ca_row(res.ca, select.row = list(contrib = 7))

 
# Graph of column points
# ++++++++++++++++++++++++++++

 
# Control colors using their contributions
fviz_ca_col(res.ca, col.col = "contrib",
   gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"))
       
# Select columns with select.col argument
   # You can select by contrib, cos2 and name 
   # as previously described for ind
# Select the top 3 contributing columns
fviz_ca_col(res.ca, select.col = list(contrib = 3))
    
    
 



