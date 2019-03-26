library(franc)


### Encoding: UTF-8

### Name: franc
### Title: Detect the language of a string
### Aliases: franc

### ** Examples

## afr
franc("Alle menslike wesens word vry")

## nno
franc("Alle mennesker er født frie og")

## Too short, und
franc("the")

## You can change what’s too short (default: 10), sco
franc("the", min_length = 3)



