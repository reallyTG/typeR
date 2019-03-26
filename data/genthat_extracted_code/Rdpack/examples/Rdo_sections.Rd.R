library(Rdpack)


### Name: Rdo_sections
### Title: Locate the sections in Rd objects
### Aliases: Rdo_sections Rdo_locate_core_section
### Keywords: Rd

### ** Examples

infile <- system.file("examples", "tz.Rd", package = "Rdpack")
rd <- tools::parse_Rd(infile)

## Locate all top level sections in rd
sections <- Rdo_sections(rd)
## How many sections there are in rd?
length(sections)
## What are their titles?
sapply(sections, function(x) x$title)

## The names of builtin sections include the backslash
Rdo_locate_core_section(rd, "\\title")

## Locate a user defined secion
Rdo_locate_core_section(rd, "Further information")

## The names of builtin sections include the backslash
Rdo_locate_core_section(rd, "\\details")

## All appearances of the requested section are returned
Rdo_locate_core_section(rd, "\\alias")
Rdo_locate_core_section(rd, "\\keyword")




