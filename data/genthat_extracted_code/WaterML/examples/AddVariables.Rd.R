library(WaterML)


### Name: AddVariables
### Title: AddVariables
### Aliases: AddVariables
### Keywords: waterml

### ** Examples

user <- "admin"
pass <- "password"
server <- "http://worldwater.byu.edu/app/index.php/default/services/cuahsi_1_1.asmx"
#make random site codes
random_code = sprintf("R-%04d",sample(1:10000, 1))
my_variables <- data.frame(
  VariableCode = random_code,
  VariableName = "Color",
  Speciation = "Not Applicable",
  VariableUnitsID = 189,
  SampleMedium = "Groundwater",
  ValueType = "Sample",
  IsRegular = 1,
  TimeSupport = 0,
  TimeUnitsID = 100,
  DataType = "Average",
  GeneralCategory = "Hydrology",
  NoDataValue = -9999
)

added_variables <- AddVariables(server, username=user, password=pass,
                                variables=my_variables)



