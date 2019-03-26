## ---- eval = TRUE, echo = FALSE------------------------------------------
# All defaults
knitr::include_graphics("general_principle.jpg",dpi=NA)

## ---- eval = TRUE, echo = TRUE-------------------------------------------

my_data <- data.frame(x=c(1,2),y=c(1,2))

RTest::xmlWriteData_data.frame("data.frame",my_data,"test01")


## ---- eval = TRUE, echo = TRUE, message = FALSE, warning=FALSE-----------
library(magrittr)
library(RTest)
RTest::RTest.execute(
   testcase.directory = list.dirs(find.package('RTest'),recursive=TRUE) %>% 
 				grep(pattern="xml-templates",value=TRUE),
 	open=FALSE,
    f.pattern = "RTest_TC-generic.xml"
)

## ---- eval = TRUE, echo = FALSE------------------------------------------
# All defaults
knitr::include_graphics("report_generic.jpg",dpi=NA)

