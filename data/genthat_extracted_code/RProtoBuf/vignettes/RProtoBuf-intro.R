## ----init, echo=FALSE-------------------------------------------------------------------
library("RProtoBuf")
options("width"=90)

## ----readproto--------------------------------------------------------------------------
args(readProtoFiles)

## ----loadprotos, eval=FALSE-------------------------------------------------------------
#  pdir <- system.file("proto", package = "RProtoBuf")
#  pfile <- file.path(pdir, "addressbook.proto")
#  readProtoFiles(pfile)

## ----readir, eval=FALSE-----------------------------------------------------------------
#  dir(pdir, pattern = "\\.proto$", full.names = TRUE)
#  readProtoFiles(dir = pdir)

## ----protofrompackage, eval=FALSE-------------------------------------------------------
#  readProtoFiles( package = "RProtoBuf" )

## ----lsproto----------------------------------------------------------------------------
ls("RProtoBuf:DescriptorPool")

## ----newmsg-----------------------------------------------------------------------------
p <- new(tutorial.Person, name = "Romain", id = 1)

## ----modmsg-----------------------------------------------------------------------------
p$name
p$id
p$email <- "francoisromain@free.fr"

## ----modfields--------------------------------------------------------------------------
p[["name"]] <- "Romain Francois"
p[[ 2 ]] <- 3
p[[ "email" ]]

## ----msgdisp----------------------------------------------------------------------------
p

## ----writeaschar------------------------------------------------------------------------
cat(as.character(p))

## ----serial1----------------------------------------------------------------------------
serialize( p, NULL )

## ----serial2----------------------------------------------------------------------------
tf1 <- tempfile()
tf1
serialize( p, tf1 )
readBin(tf1, raw(0), 500)

## ----serial3----------------------------------------------------------------------------
tf2 <- tempfile()
con <- file(tf2, open = "wb")
serialize(p, con)
close(con)
readBin(tf2, raw(0), 500)

## ----serial4----------------------------------------------------------------------------
# serialize to a file
p$serialize(tf1)
# serialize to a binary connection
con <- file(tf2, open = "wb")
p$serialize(con)
close(con)

## ----parse1-----------------------------------------------------------------------------
args(read)

## ----parse2-----------------------------------------------------------------------------
message <- read(tutorial.Person, tf1)
cat(as.character(message))

## ----parse3-----------------------------------------------------------------------------
con <- file(tf2, open = "rb")
message <- read(tutorial.Person, con)
close(con)
cat(as.character(message))

## ----parse4-----------------------------------------------------------------------------
# reading the raw vector payload of the message
payload <- readBin(tf1, raw(0), 5000)
message <- read( tutorial.Person, payload )

## ----parse5-----------------------------------------------------------------------------
# reading from a file
message <- tutorial.Person$read(tf1)
# reading from a binary connection
con <- file(tf2, open = "rb")
message <- tutorial.Person$read(con)
close(con)
# read from the payload
message <- tutorial.Person$read(payload)

## ----classes1, eval=FALSE---------------------------------------------------------------
#  str(p)

## ----retrieve---------------------------------------------------------------------------
message <- new(tutorial.Person,
               name = "foo", email = "foo@bar.com", id = 2,
               phone = list(new(tutorial.Person.PhoneNumber,
                                number = "+33(0)...", type = "HOME"),
                            new(tutorial.Person.PhoneNumber,
                                number = "+33(0)###", type = "MOBILE")
                            )
               )
message$name
message$email
message[["phone"]]
# using the tag number
message[[2]] # id

## ----modify-----------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", id = 2)
message$email <- "foo@bar.com"
message[["id"]] <- 42
message[[1]] <- "foobar"
cat(message$as.character())

## ----has--------------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo")
message$has("name")
message$has("id")
message$has("phone")

## ----methodclone------------------------------------------------------------------------
m1 <- new(tutorial.Person, name = "foo")
m2 <- m1$clone()
m2$email <- "foo@bar.com"
cat(as.character(m1))
cat(as.character(m2))

## ----methodisinit-----------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo")
message$isInitialized()
message$id <- 2
message$isInitialized()

## ----messageserialize1------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
tf1 <- tempfile()
tf1
message$serialize(tf1)

tf2 <- tempfile()
tf2
con <- file(tf2, open = "wb")
message$serialize(con)
close(con)

## ----messageserialize2------------------------------------------------------------------
readBin(tf1, raw(0), 500)
readBin(tf2, raw(0), 500)

## ----messageserialize3------------------------------------------------------------------
message$serialize(NULL)

## ----messageclear-----------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
cat(as.character(message))
message$clear()
cat(as.character(message))

message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
message$clear("id")
cat(as.character(message))

## ----messagesize------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo",
               phone = list(new(tutorial.Person.PhoneNumber,
                                number = "+33(0)...", type = "HOME"),
                            new(tutorial.Person.PhoneNumber,
                                number = "+33(0)###", type = "MOBILE")
                            ))
message$size("phone")
size( message, "phone")

## ----messagebytesize--------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
message$bytesize()
bytesize(message)
length(message$serialize(NULL))

## ----messageswap------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo",
               phone = list(new(tutorial.Person.PhoneNumber,
                                number = "+33(0)...", type = "HOME"  ),
                            new(tutorial.Person.PhoneNumber,
                                number = "+33(0)###", type = "MOBILE"  )))
message$swap("phone", 1, 2)
cat(as.character(message$phone[[1]]))
cat(as.character(message$phone[[2]]))

swap(message, "phone", 1, 2)
cat(as.character(message$phone[[1]]))
cat(as.character(message$phone[[2]]))

## ----messagset--------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo",
               phone = list(new(tutorial.Person.PhoneNumber,
                                number = "+33(0)...", type = "HOME"),
                            new(tutorial.Person.PhoneNumber,
                                number = "+33(0)###", type = "MOBILE")))
number <- new(tutorial.Person.PhoneNumber, number = "+33(0)---", type = "WORK")
message$set("phone", 1, number)
cat(as.character( message))

## ----messagefetch-----------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo",
               phone = list(new(tutorial.Person.PhoneNumber,
                                number = "+33(0)...", type = "HOME"),
                            new(tutorial.Person.PhoneNumber,
                                number = "+33(0)###", type = "MOBILE"  )))
message$fetch("phone", 1)

## ----messageset-------------------------------------------------------------------------
if (!exists("protobuf_unittest.TestAllTypes", "RProtoBuf:DescriptorPool")) {
    unittest.proto.file <- system.file("unitTests", "data",
                                       "unittest.proto",
                                       package="RProtoBuf")
    readProtoFiles(file=unittest.proto.file)
}

## Test setting a singular extensions.
test <- new(protobuf_unittest.TestAllExtensions)
test$setExtension(protobuf_unittest.optional_int32_extension, as.integer(1))

## ----messagegetextension----------------------------------------------------------------
test$getExtension(protobuf_unittest.optional_int32_extension)

## ----messageadd-------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo")
phone <- new(tutorial.Person.PhoneNumber, number = "+33(0)...", type = "HOME")
message$add("phone", phone)
cat(message$toString())

## ----messagestr-------------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
message$str()
str(message)

## ----messageascharacter-----------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
cat(message$as.character())
cat(as.character(message))

## ----messagetostring--------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
cat(message$toString())
cat(toString( message))

## ----messageaslist----------------------------------------------------------------------
message <- new(tutorial.Person, name = "foo", email = "foo@bar.com", id = 2)
as.list(message)

## ----messageupdate----------------------------------------------------------------------
message <- new(tutorial.Person)
update(message, name = "foo", id = 2, email = "foo@bar.com")
cat(message$as.character())

## ----messagedescriptor------------------------------------------------------------------
message <- new(tutorial.Person)
message$descriptor()
descriptor(message)

## ----messagefiledesc--------------------------------------------------------------------
message <- new(tutorial.Person)
message$fileDescriptor()
fileDescriptor(message)

## ----extractingdescriptors--------------------------------------------------------------
# field descriptor
tutorial.Person$email

# enum descriptor
tutorial.Person$PhoneType

# nested type descriptor
tutorial.Person$PhoneNumber
# same as
tutorial.Person.PhoneNumber

## ----newmethod--------------------------------------------------------------------------
tutorial.Person$new()
new(tutorial.Person) 

## ----newmethod2-------------------------------------------------------------------------
tutorial.Person$new(email = "foo@bar.com")

# same as
update(tutorial.Person$new(), email = "foo@bar.com")

## ----readmethod-------------------------------------------------------------------------
# start by serializing a message
message <- new(tutorial.Person.PhoneNumber,
               type = "HOME", number = "+33(0)....")
tf <- tempfile()
serialize(message, tf)

# now read back the message
m <- tutorial.Person.PhoneNumber$read(tf)
cat(as.character(m))

m <- read( tutorial.Person.PhoneNumber, tf)
cat(as.character(m))

## ----readasciimethod--------------------------------------------------------------------
# start by generating the ASCII representation of a message
text <- as.character(new(tutorial.Person, id=1, name="Murray"))
text
# Then read the ascii representation in as a new message object.
msg <- tutorial.Person$readASCII(text)

## ----ascharactermethod------------------------------------------------------------------
desc <- tutorial.Person
cat(desc$toString())
cat(toString(desc))
cat(as.character(tutorial.Person))

## ----aslisttmethod----------------------------------------------------------------------
tutorial.Person$as.list()

## ----asmessagemethod--------------------------------------------------------------------
tutorial.Person$asMessage()

## ----asfiledescmethod-------------------------------------------------------------------
desc <- tutorial.Person
desc$fileDescriptor()
fileDescriptor(desc)

## ----namemethod-------------------------------------------------------------------------
# simple name
tutorial.Person$name()
# name including scope
tutorial.Person$name(full = TRUE)

## ----containingtypemethod---------------------------------------------------------------
tutorial.Person$containing_type()
tutorial.Person$PhoneNumber$containing_type()

## ----fieldcountmethod-------------------------------------------------------------------
tutorial.Person$field_count()

## ----fieldmethod------------------------------------------------------------------------
tutorial.Person$field(1)

## ----nestedtypecountmethod--------------------------------------------------------------
tutorial.Person$nested_type_count()

## ----nestedtypemethod-------------------------------------------------------------------
tutorial.Person$nested_type(1)

## ----enumtypecountmethod----------------------------------------------------------------
tutorial.Person$enum_type_count()

## ----enumtypemethod---------------------------------------------------------------------
tutorial.Person$enum_type(1)

## ----ascharactermethod2-----------------------------------------------------------------
cat(as.character(tutorial.Person$PhoneNumber))

## ----tostringmethod2--------------------------------------------------------------------
cat(tutorial.Person.PhoneNumber$toString())

## ----asmessagemethod2-------------------------------------------------------------------
tutorial.Person$id$asMessage()
cat(as.character(tutorial.Person$id$asMessage()))

## ----namemethod2------------------------------------------------------------------------
# simple name.
name(tutorial.Person$id)
# name including scope.
name(tutorial.Person$id, full=TRUE)

## ----filedescriptormethod2--------------------------------------------------------------
fileDescriptor(tutorial.Person$id)
tutorial.Person$id$fileDescriptor()

## ----containingtypemethod2--------------------------------------------------------------
containing_type(tutorial.Person$id)
tutorial.Person$id$containing_type()

## ----isextensionsmethod2----------------------------------------------------------------
is_extension( tutorial.Person$id )
tutorial.Person$id$is_extension()

## ----numbermethod2----------------------------------------------------------------------
number( tutorial.Person$id )
tutorial.Person$id$number()

## ----typemethod2------------------------------------------------------------------------
type( tutorial.Person$id )
tutorial.Person$id$type()

## ----cpptypemethod2---------------------------------------------------------------------
cpp_type( tutorial.Person$id )
tutorial.Person$id$cpp_type()

## ----labelmethod2-----------------------------------------------------------------------
label(tutorial.Person$id)
label(tutorial.Person$id, TRUE)
tutorial.Person$id$label(TRUE)

## ----isrepeatedmethod2------------------------------------------------------------------
is_repeated( tutorial.Person$id )
tutorial.Person$id$is_repeated()

## ----isrequiredmethod2------------------------------------------------------------------
is_required( tutorial.Person$id )
tutorial.Person$id$is_required()

## ----isoptionalmethod2------------------------------------------------------------------
is_optional(tutorial.Person$id)
tutorial.Person$id$is_optional()

## ----hasdefaultvaluemethod2-------------------------------------------------------------
has_default_value(tutorial.Person$PhoneNumber$type)
has_default_value(tutorial.Person$PhoneNumber$number)

## ----defaultvaluemethod2----------------------------------------------------------------
default_value(tutorial.Person$PhoneNumber$type)
default_value(tutorial.Person$PhoneNumber$number)

## ----messagetypemethod2-----------------------------------------------------------------
message_type(tutorial.Person$phone)
tutorial.Person$phone$message_type()

## ----enumtypemethod2--------------------------------------------------------------------
enum_type(tutorial.Person$PhoneNumber$type)

## ----extractingdescriptors2-------------------------------------------------------------
tutorial.Person$PhoneType$WORK
name(tutorial.Person$PhoneType$value(number=2))

## ----aslistmethod3----------------------------------------------------------------------
as.list(tutorial.Person$PhoneType)

## ----ascharactermethod3-----------------------------------------------------------------
cat(as.character(tutorial.Person$PhoneType ))

## ----asmessagemethod3-------------------------------------------------------------------
tutorial.Person$PhoneType$asMessage()
cat(as.character(tutorial.Person$PhoneType$asMessage()))

## ----namemethod3------------------------------------------------------------------------
# simple name.
name( tutorial.Person$PhoneType )
# name including scope.
name( tutorial.Person$PhoneType, full=TRUE )

## ----filedescriptormethod3--------------------------------------------------------------
fileDescriptor(tutorial.Person$PhoneType)
tutorial.Person$PhoneType$fileDescriptor()

## ----containing_typemethod3-------------------------------------------------------------
tutorial.Person$PhoneType$containing_type()

## ----lengthmethod3----------------------------------------------------------------------
length(tutorial.Person$PhoneType)
tutorial.Person$PhoneType$length()

## ----hasmethod3-------------------------------------------------------------------------
tutorial.Person$PhoneType$has("WORK")
tutorial.Person$PhoneType$has("nonexistant")

## ----value_countmethod3-----------------------------------------------------------------
value_count(tutorial.Person$PhoneType)
tutorial.Person$PhoneType$value_count()

## ----valuemethod3-----------------------------------------------------------------------
tutorial.Person$PhoneType$value(1)
tutorial.Person$PhoneType$value(name="HOME")
tutorial.Person$PhoneType$value(number=1)

## ----numbermethod4----------------------------------------------------------------------
number(tutorial.Person$PhoneType$value(number=2))

## ----namemethod4------------------------------------------------------------------------
# simple name.
name(tutorial.Person$PhoneType$value(number=2))
# name including scope.
name(tutorial.Person$PhoneType$value(number=2), full=TRUE)

## ----enum_typemethod4-------------------------------------------------------------------
enum_type(tutorial.Person$PhoneType$value(number=2))

## ----as.charactermethod4----------------------------------------------------------------
cat(as.character(tutorial.Person$PhoneType$value(number=2)))

## ----tostringmethod4--------------------------------------------------------------------
cat(toString(tutorial.Person$PhoneType$value(number=2)))

## ----asmessagemethod4-------------------------------------------------------------------
tutorial.Person$PhoneType$value(number=2)$asMessage()
cat(as.character(tutorial.Person$PhoneType$value(number=2)$asMessage()))

## ----filedescriptorssubsection----------------------------------------------------------
f <- tutorial.Person$fileDescriptor()
f
f$Person

## ----as.charactermethod5----------------------------------------------------------------
cat(as.character(fileDescriptor(tutorial.Person)))

## ----tostringmethod5--------------------------------------------------------------------
cat(fileDescriptor(tutorial.Person)$toString())

## ----asmessagemethod5-------------------------------------------------------------------
asMessage(tutorial.Person$fileDescriptor())
cat(as.character(asMessage(tutorial.Person$fileDescriptor())))

## ----as.listmethod5---------------------------------------------------------------------
as.list(tutorial.Person$fileDescriptor())

## ----namemethod5------------------------------------------------------------------------
name(tutorial.Person$fileDescriptor())
tutorial.Person$fileDescriptor()$name(TRUE)

## ----packagemethod5---------------------------------------------------------------------
tutorial.Person$fileDescriptor()$package()

## ----coerceobjectstomessage-------------------------------------------------------------
# coerce a message type descriptor to a message
asMessage(tutorial.Person)

# coerce a enum descriptor
asMessage(tutorial.Person.PhoneType)

# coerce a field descriptor
asMessage(tutorial.Person$email)

# coerce a file descriptor
asMessage(fileDescriptor(tutorial.Person))

## ----identical--------------------------------------------------------------------------
m1 <- new(tutorial.Person, email = "foo@bar.com", id = 2)
m2 <- update(new(tutorial.Person) , email = "foo@bar.com", id = 2)
identical(m1, m2)

## ----equalforidentical------------------------------------------------------------------
m1 == m2
m1 != m2

## ----merge------------------------------------------------------------------------------
m1 <- new(tutorial.Person, name = "foobar")
m2 <- new(tutorial.Person, email = "foo@bar.com")
m3 <- merge(m1, m2)
cat(as.character(m3))

## ----P----------------------------------------------------------------------------------
P("tutorial.Person")
new(P("tutorial.Person"))

# but we can do this instead
tutorial.Person
new(tutorial.Person)

## ----64bitex----------------------------------------------------------------------------
2^53 == (2^53 + 1)

## ----64bitex2, echo=FALSE---------------------------------------------------------------
if (!exists("protobuf_unittest.TestAllTypes", "RProtoBuf:DescriptorPool")) {
    unittest.proto.file <- system.file("unitTests", "data", "unittest.proto",
                                       package="RProtoBuf")
    readProtoFiles(file=unittest.proto.file)
}

## ----groupsfeature----------------------------------------------------------------------
test <- new(protobuf_unittest.TestAllTypes)
test$optionalgroup$a <- 3
test$optionalgroup$a
cat(as.character(test))

