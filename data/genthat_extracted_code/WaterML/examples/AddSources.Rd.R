library(WaterML)


### Name: AddSources
### Title: AddSources
### Aliases: AddSources
### Keywords: waterml

### ** Examples

user <- "admin"
pass <- "password"
server <- "http://worldwater.byu.edu/app/index.php/default/services/cuahsi_1_1.asmx"
#make random source codes
random_id = sample(1:10000,size=1)
random_name = paste("R test source", random_id)
my_sources <- data.frame(
  Organization = random_name,
  Description = paste("Uploaded from R:",random_name),
  SourceLink = paste("http://", random_id, sep=""),
  ContactName = random_name,
  ContactPhone = "012-345-6789",
  ContactEmail = "test<at>gmail.com",
  Address = random_name,
  City = random_name,
  State = random_name,
  Zipcode = random_id * 10,
  Citation = paste("Uploaded from R as a test:", random_name),
  MetadataID = 10
)

added_sources <- AddSources(server, username=user, password=pass,
                                sources=my_sources)



