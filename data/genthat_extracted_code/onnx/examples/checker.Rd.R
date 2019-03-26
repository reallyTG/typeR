library(onnx)


### Name: check
### Title: Check Whether The Proto is Valid
### Aliases: check check.onnx_pb2.ModelProto check.onnx_pb2.GraphProto
###   check.onnx_pb2.TensorProto check.onnx_pb2.AttributeProto
###   check.onnx_pb2.NodeProto

### ** Examples

## Not run: 
##D 
##D library(onnx)
##D 
##D # Define a node protobuf and check whether it's valid
##D node_def <- make_node("Relu", list("X"), list("Y"))
##D check(node_def)
##D 
## End(Not run)



