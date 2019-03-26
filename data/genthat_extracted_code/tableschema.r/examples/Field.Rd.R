library(tableschema.r)


### Name: Field
### Title: Field class
### Aliases: Field
### Keywords: data

### ** Examples

DESCRIPTOR = list(name = "height", type = "number")

field <- Field$new(descriptor = DESCRIPTOR)

# get correct instance
field$name
field$format
field$type

# return true on test
field$testValue(1)

# cast value
field$cast_value(1)

# expand descriptor by defaults
field <- Field$new(descriptor = list(name = "name"))

field$descriptor


# parse descriptor with "enum" constraint
field <- Field$new(descriptor = list(name = "status", type = "string", 
                   constraints = list(enum = list('active', 'inactive'))))

field$testValue('active')
field$testValue('inactive')
field$testValue('activia')
field$cast_value('active')


# parse descriptor with "minimum" constraint'
field <- Field$new(descriptor = list(name = "length", type = "integer", 
                   constraints = list(minimum = 100)))

field$testValue(200)
field$testValue(50)


# parse descriptor with "maximum" constraint'
field <- Field$new(descriptor = list(name = "length", type = "integer", 
                   constraints = list(maximum = 100)))

field$testValue(50)
field$testValue(200)




