library(RTest)


### Name: RTest.execute
### Title: Function to generally execute a Test Case collection
### Aliases: RTest.execute

### ** Examples


RTest::RTest.execute(
 testcase.directory = list.dirs(find.package('RTest'),recursive=TRUE) %>% 
				grep(pattern="xml-templates",value=TRUE),
	open=FALSE,
 f.pattern = "RTest_TC-generic.xml"
)




