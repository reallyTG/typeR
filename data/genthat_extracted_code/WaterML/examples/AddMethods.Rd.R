library(WaterML)


### Name: AddMethods
### Title: AddMethods
### Aliases: AddMethods
### Keywords: waterml

### ** Examples

user <- "admin"
pass <- "password"
server <- "http://worldwater.byu.edu/app/index.php/default/services/cuahsi_1_1.asmx"
#make random site codes
random_description <- sprintf("R Test Method %04d",sample(1:10000, 1))
random_link <- "http://example.com"
my_methods <- data.frame(
  MethodDescription = random_description,
  MethodLink = random_link
)

added_methods <- AddMethods(server, username=user, password=pass,
                                methods=my_methods)



