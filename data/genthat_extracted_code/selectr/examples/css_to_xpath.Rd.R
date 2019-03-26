library(selectr)


### Name: css_to_xpath
### Title: Translate a CSS selector to an equivalent XPath expression.
### Aliases: css_to_xpath

### ** Examples

  css_to_xpath(".testclass")
  css_to_xpath("#testid", prefix = "")
  css_to_xpath("#testid .testclass")
  css_to_xpath(":checked", translator = "html")



