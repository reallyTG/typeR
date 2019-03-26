library(WaterML)


### Name: AddValues
### Title: AddValues
### Aliases: AddValues
### Keywords: WaterML

### ** Examples

user <- "admin"
pass <- "password"
server <- "http://worldwater.byu.edu/app/index.php/default/services/cuahsi_1_1.asmx"
sourceID = 15
qualityID = 1
variableID = 43
siteID = 170
methodID = 10
random_times <- sort(Sys.time() + runif(3, 0, 10)*60)
random_values <- runif(3, 0, 100)
my_values <- data.frame(Time=random_times, DataValue=random_values)

status  <- AddValues(server, username=user, password=pass,
                     site=siteID, variable=variableID,
                     methodID=methodID, sourceID=sourceID,
                     qualityControl=qualityID, values=my_values)



