library(vcr)


### Name: cassettes
### Title: List cassettes, get current cassette, etc.
### Aliases: cassettes current_cassette cassette_path

### ** Examples

vcr_configure(dir = tempdir())

# list all cassettes
cassettes()
cassettes(on_disk = FALSE)

# list the currently active cassette
insert_cassette("stuffthings")
current_cassette()
eject_cassette()

cassettes()
cassettes(on_disk = FALSE)

# list the path to cassettes
cassette_path()
vcr_configure(file.path(tempdir(), "foo"))
cassette_path()

vcr_configure_reset()



