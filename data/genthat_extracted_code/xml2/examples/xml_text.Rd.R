library(xml2)


### Name: xml_text
### Title: Extract or modify the text
### Aliases: xml_text xml_text<- xml_set_text xml_double xml_integer

### ** Examples

x <- read_xml("<p>This is some text. This is <b>bold!</b></p>")
xml_text(x)
xml_text(xml_children(x))

x <- read_xml("<x>This is some text. <x>This is some nested text.</x></x>")
xml_text(x)
xml_text(xml_find_all(x, "//x"))

x <- read_xml("<p>   Some text    </p>")
xml_text(x, trim = TRUE)

# xml_double() and xml_integer() are useful for extracting numeric
attributes
x <- read_xml("<plot><point x='1' y='2' /><point x='2' y='1' /></plot>")
xml_integer(xml_find_all(x, "//@x"))



