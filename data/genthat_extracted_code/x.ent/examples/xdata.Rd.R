library(x.ent)


### Name: xdata
### Title: Transform the results to data frame
### Aliases: xdata xdata_value
### Keywords: xdata xdata_value

### ** Examples

  xdata() #show all entities
  xdata(c("p","b")) #show two entities: "p", "b"
  xdata_value("p") #show only values of entity "p"
  #there are two columns "value" et "freq" in this data frame
  xdata_value("p")[["value"]] #convert to a verctor



