library(VeryLargeIntegers)


### Name: 01. Basics
### Title: Very Large Integers Basics
### Aliases: '01. Basics' as.vli as.vli.default as.vli.character
###   as.vli.numeric asnumeric asnumeric.default asnumeric.vli
###   as.integer.vli as.character.vli vli print.vli is.vli

### ** Examples

## Creating a new vli object
x <- as.vli("-89027148538375418689123052")

## Printing a vli object
print(x)

## Testing the class
is.vli(x)

## Coercing into a character object
as.character(x)

## Accessing to the attributes of the vli object
x$sign
x$value
x$length

## Punctuation signs are ignored
as.vli("2345.25")



