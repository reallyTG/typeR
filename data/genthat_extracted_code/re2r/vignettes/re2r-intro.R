## ---- include=FALSE------------------------------------------------------
options( markdown.HTML.template = system.file("misc", "docco-template.html", package = "knitr"))
library(re2r)

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  re2_detect(string, pattern)

## ------------------------------------------------------------------------
re2_detect("this is just one test", "(o.e)")

## ------------------------------------------------------------------------
re2_detect("test@gmail.com", "\\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}\\b")

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  re2_match(string, pattern)

## ------------------------------------------------------------------------
(res = re2_match("this is just one test", "(o.e)"))
str(res)

## ------------------------------------------------------------------------
(res = re2_match("this is just one test", "(?P<testname>this)( is)"))
str(res)

## ------------------------------------------------------------------------
test_string = c("this is just one test", "the second test");
(res = re2_match(test_string, "is"))
str(res)

## ------------------------------------------------------------------------
re2_match_all(
            string = c("this is test", 
                      "this is test, and this is not test", 
                      "they are tests"), 
            pattern = "(?P<testname>this)( is)")

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  re2_replace(string, pattern, rewrite)

## ------------------------------------------------------------------------
input_string = "this is just one test";
new_string = "my"
re2_replace(input_string, "(o.e)", new_string)

## ---- eval=FALSE, include=TRUE-------------------------------------------
#  re2_extract(input, pattern)

## ------------------------------------------------------------------------
re2_extract("yabba dabba doo", "yabba")
re2_extract("test@me.com", "(.*)@([^.]*)")

## ------------------------------------------------------------------------
regexp = re2("test", case_sensitive = FALSE)
print(regexp)

