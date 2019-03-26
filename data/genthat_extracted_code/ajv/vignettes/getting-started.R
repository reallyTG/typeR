## ---- eval=FALSE---------------------------------------------------------
#  library('ajv')
#  var ajv = Ajv() # options can be passed, e.g. list(allErrors= TRUE)
#  var validate = ajv$compile(schema)
#  var valid = validate(data)
#  if (!valid) print(validate$errors)

## ---- eval=FALSE---------------------------------------------------------
#  # ...
#  var valid = ajv$validate(schema, data)
#  if (!valid) print(ajv$errors)
#  # ...

## ---- eval=FALSE---------------------------------------------------------
#  # ...
#  ajv$addSchema(schema, 'mySchema')
#  var valid = ajv$validate('mySchema', data)
#  if (!valid) print(ajv$errorsText())
#  # ...

