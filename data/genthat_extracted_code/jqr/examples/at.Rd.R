library(jqr)


### Name: at
### Title: Format strings and escaping
### Aliases: at at_

### ** Examples

x <- '{"user":"stedolan","titles":["JQ Primer", "More JQ"]}'
x %>% at(base64) %>% peek
x %>% at(base64)
x %>% index() %>% at(base64)

y <- '["fo", "foo", "barfoo", "foobar", "barfoob"]'
y %>% index() %>% at(base64)

## prepare for shell use
y %>% index() %>% at(sh)

## rendered as csv with double quotes
z <- '[1, 2, 3, "a"]'
z %>% at(csv)

## rendered as csv with double quotes
z %>% index()
z %>% index() %>% at(text)

## % encode for URI's
#### DOESNT WORK --------------------------

## html escape
#### DOESNT WORK --------------------------

## serialize to json
#### DOESNT WORK --------------------------



