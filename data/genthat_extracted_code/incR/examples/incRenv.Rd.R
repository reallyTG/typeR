library(incR)


### Name: incRenv
### Title: Matching environmental and nest temperatures
### Aliases: incRenv

### ** Examples

data(incR_envdata)  # environmental data
head (incR_envdata)

data(incR_rawdata)  # loading nest data
head (incR_rawdata)

# the first step in to format the raw data using incRprep
new.data <- incRprep (data=incR_rawdata,
                      date.name= "DATE",
                      date.format= "%d/%m/%Y %H:%M",
                      timezone="GMT",
                      temperature.name="temperature")
                      
# then use incRenv to merge environmental data
new.data2 <- incRenv (data.nest = new.data,
                      data.env = incR_envdata, 
                      env.temperature.name = "env_temperature", 
                      env.date.name = "DATE", 
                      env.date.format = "%d/%m/%Y %H:%M", 
                      env.timezone = "GMT")
                     
head (new.data2, 3)



