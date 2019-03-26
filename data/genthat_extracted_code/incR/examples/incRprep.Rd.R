library(incR)


### Name: incRprep
### Title: Data preparation for incubation analysis in incR
### Aliases: incRprep

### ** Examples

# loading example data
data(incubation_rawdata)
new.data <- incRprep (data=incR_rawdata,
                       date.name= "DATE",
                       date.format= "%d/%m/%Y %H:%M",
                       timezone="GMT",
                       temperature.name="temperature")
head (new.data, 3)



