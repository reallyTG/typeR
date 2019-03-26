library(searchable)


### Name: searchable-package
### Title: searchable
### Aliases: searchable-package

### ** Examples

# ATOMIC VECTORS:
    v <- c( a=1, b=2, B=3, c=4, c2=5 )
    sv <- searchable(v)


  # FLEXIBLY FIND ELEMENTS BY NAME
    sv[ regex('c') ]
    sv[ fixed('c') ]

    sv[ ignore.case('b') ]


  # FLEXIBLY REPLACEMENT ELEMENTS BY NAME
    sv[ regex('c.?') ]   <- "3rd"
    sv


  # SET DEFAULT SEARCH FOR TARGET/OBJECT
    sv <- searchable(v, case_insensitive = TRUE )
    sv['b']
    sv['B']

    sv <- regex(sv)
    sv['c']

    sv <- ignore.case(sv)
    sv['b']
    sv['c']                  # st


  # USE ON (RECURSIVE) LISTS:
    l <- list( a=1, b=2, c=3 )
    sl <- searchable(l)
    sl["b"]
    sl[ ignore.case("B") ]


  # USE WITH MAGRITTR
   ## Not run: 
##D     sl[ "B"  %>% ignore.case ]
##D     "b" %>% sl[.]
##D     "B" %>% ignore.case %>% sl[.]
##D    
## End(Not run)



