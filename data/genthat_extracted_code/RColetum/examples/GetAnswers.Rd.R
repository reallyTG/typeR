library(RColetum)


### Name: GetAnswers
### Title: Get all the answers of a form.
### Aliases: GetAnswers

### ** Examples

## No test: 
GetAnswers("cizio7xeohwgc8k4g4koo008kkoocwg", 5705)
GetAnswers("cizio7xeohwgc8k4g4koo008kkoocwg", ,"RColetum Test - Iris", TRUE)
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             nameForm = "RColetum Test - Iris")
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             source = NULL,
             createdAfter = "2012-12-20",
             createdBefore = "2018-12-20"
             )
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             source = NULL,
             createdAfter = "2012-12-20",
             createdBefore = "2018-12-20T19:20:30+01:00"
             )
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             source = NULL,
             createdAfter = "2012-12-20T19:20:30Z",
             createdBefore = "2018-12-20T19:20:30+01:00"
             )
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             source = "web_public",
             createdAfter = "2012-12-20T19:20:30+01:00",
             createdBefore = "2018-12-20T19:20:30+01:00"
             )
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             singleDataFrame = TRUE,
             source = "web_private",
             createdAfter = "2012-12-20T19:20:30Z",
             createdBefore = "2018-12-20T19:20:30Z"
             )
GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             idForm = 5705,
             singleDataFrame = TRUE,
             source = "web_private",
             createdAfter = "2012-12-20T19:20:30Z",
             createdBefore = "2018-12-20T19:20:30Z",
             createdDeviceAfter = "2012-12-20T19:20:30Z",
             createdDeviceBefore = "2018-12-20T19:20:30Z",
             updatedAfter = "2018-05-20T19:20:30Z",
             updatedBefore = "2018-06-20T19:20:30Z"
             )
## End(No test)




