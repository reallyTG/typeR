library(subscore)


### Name: CTTsub
### Title: This main function estimates true subscores using different
###   methods based on original CTT scores.
### Aliases: CTTsub

### ** Examples

# Transfering original scored data to a list format
# that can be used in other functions.
test.data<-data.prep(scored.data,c(3,15,15,20),
                     c("Algebra","Geometry","Measurement", "Math"))
#----------------------------------------------
# Estimating subscores using Haberman's methods       
CTTsub(test.data,method="Haberman") # Estimating subscores using Haberman's methods 

# Obtaining original correlation for the three methods
CTTsub(test.data,method="Haberman")$Correlation  

# Obtaining disattenuated correlation for the three methods
CTTsub(test.data,method="Haberman")$Disattenuated.correlation  

# Obtaining PRMSEs for the three methods
CTTsub(test.data,method="Haberman")$PRMSE  

# Obtaining descriptive statistics summary for estimated subscores  
CTTsub(test.data,method="Haberman")$summary 

# Obtaining raw subscores  
CTTsub(test.data,method="Haberman")$subscore.original  

# Obtaining subscores that are estimated as a function of the observed subscores 
CTTsub(test.data,method="Haberman")$subscore.s 

# Obtaining subscores that are estimated as a function of the observed total score 
CTTsub(test.data,method="Haberman")$subscore.x  

# Obtaining subscores that are estimated as a function of 
# both the observed subscores and the observed total score.
CTTsub(test.data,method="Haberman")$subscore.sx  

#-------------------------------------------      
# Estimating subscores using Wainer's method
CTTsub(test.data,method="Wainer") 
       
# Obtaining descriptive statistics summary for subscores
CTTsub(test.data,method="Wainer")$summary   

# Obtaining original subscores
CTTsub(test.data,method="Wainer")$subscore.original 

# Obtaining subscores that are estimated using Wainer's augmentation method  
CTTsub(test.data,method="Wainer")$subscore.augmented  
        



