library(nomisr)


### Name: nomis_get_metadata
### Title: Nomis metadata concepts and types
### Aliases: nomis_get_metadata

### ** Examples

## No test: 
a <- nomis_get_metadata('NM_1_1')

tibble::glimpse(a)

b <- nomis_get_metadata('NM_1_1', 'geography')

tibble::glimpse(b)

# returns all types of geography
c <- nomis_get_metadata('NM_1_1', 'geography', 'TYPE')

tibble::glimpse(c)

# returns geography types available within Wigan
d <- nomis_get_metadata('NM_1_1', 'geography', '1879048226')

tibble::glimpse(d)

e <- nomis_get_metadata('NM_1_1', 'item', geography = 1879048226, sex = 5)

print(e)

f <- nomis_get_metadata('NM_1_1', 'item', search = "*married*")

tibble::glimpse(f)
## End(No test)



