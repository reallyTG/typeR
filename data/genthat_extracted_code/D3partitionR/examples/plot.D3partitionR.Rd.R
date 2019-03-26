library(D3partitionR)


### Name: plot.D3partitionR
### Title: Plot D3partitionR object
### Aliases: plot.D3partitionR

### ** Examples

require(titanic)
require(data.table)
## Reading data
titanic_data = data.table(titanic::titanic_train)

##Agregating data to have unique sequence for the 4 variables
var_names=c('Sex','Embarked','Pclass','Survived')
data_plot=titanic_data[,.N,by=var_names]
data_plot[,(var_names):=lapply(var_names,function(x){data_plot[[x]]=paste0(x,' ',data_plot[[x]])
})]

## Plotting the chart
library("magrittr")
d3=D3partitionR() %>%
 add_data(data_plot,count = 'N',steps=c('Sex','Embarked','Pclass','Survived')) %>%
 add_title('Titanic')
## Not run: 
##D plot(d3)
## End(Not run)



