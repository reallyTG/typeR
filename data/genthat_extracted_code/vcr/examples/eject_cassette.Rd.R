library(vcr)


### Name: eject_cassette
### Title: Eject a cassette
### Aliases: eject_cassette

### ** Examples

vcr_configure(dir = tempdir())
insert_cassette("hello")
(x <- current_cassette())

# by default does current cassette
x <- eject_cassette()
x
# can also select by cassette name
# eject_cassette(cassette = "hello")



