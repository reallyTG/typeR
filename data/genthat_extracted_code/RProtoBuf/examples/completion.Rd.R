library(RProtoBuf)


### Name: completion
### Title: Completion support for protocol buffer messages and descriptors
### Aliases: .DollarNames.Message .DollarNames.Descriptor
###   .DollarNames.EnumDescriptor .DollarNames.FieldDescriptor
###   .DollarNames.FileDescriptor .DollarNames.ServiceDescriptor
###   .DollarNames.MethodDescriptor .DollarNames.ZeroCopyInputStream
###   .DollarNames.ZeroCopyOutputStream
### Keywords: programming

### ** Examples

# creating a prototype message from the descriptor
p <- new( tutorial.Person )

.DollarNames( p )
.DollarNames( tutorial.Person )
# but this is usually used with the <TAB> expansion on the command line
# <TAB> means "press the TAB key"
# p$<TAB>
# Person$<TAB>




