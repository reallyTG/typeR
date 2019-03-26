library(Unicode)


### Name: u_char_properties
### Title: Unicode Character Properties
### Aliases: u_char_info u_char_property u_char_properties

### ** Examples

## When was the Euro sign added to Unicode?
x <- u_char_from_name("EURO SIGN")
u_char_property(x, "Age")

## List the currently available Unicode character properties.
u_char_properties()



