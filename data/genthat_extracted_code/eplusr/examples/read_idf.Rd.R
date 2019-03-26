library(eplusr)


### Name: read_idf
### Title: Read an EnergyPlus Input Data File (IDF)
### Aliases: read_idf

### ** Examples

# example model shipped with eplusr from EnergyPlus v8.8
idf_path <- system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr") # v8.8

# if neither EnergyPlus v8.8 nor Idd v8.8 was found, error will occur
is_avail_eplus(8.8)

is_avail_idd(8.8)

## Not run: (read_idf(idf_path))

# if EnergyPlus v8.8 is found but Idd v8.8 was not, `Energy+.idd` in EnergyPlus
# installation folder will be used for pasing
is_avail_eplus(8.8)
is_avail_idd(8.8)

## Not run: read_idf(idf_path)

# if Idd v8.8 is found, it will be used automatically
is_avail_idd(8.8)

## Not run: read_idf(idf_path)

# argument `idd` can be specified explicitly using `use_idd()`
## Not run: read_idf(idf_path, idd = use_idd(8.8))

# you can set `download` arugment to "auto" in `use_idd()` if you want to
# automatically download corresponding IDD file when necessary
read_idf(idf_path, use_idd(8.8, download = "auto"))

# Besides use a path to an IDF file, you can also provide IDF in literal
# string format
idf_string <-
    "
    Version, 8.8;
    Building,
        Building;                !- Name
    "

read_idf(idf_string, use_idd(8.8, download = "auto"))



