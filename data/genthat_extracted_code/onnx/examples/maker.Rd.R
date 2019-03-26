library(onnx)


### Name: make_attribute
### Title: Make Different Types of Protos
### Aliases: make_attribute make_graph make_node make_tensor
###   make_tensor_value_info

### ** Examples

## Not run: 
##D 
##D library(onnx)
##D 
##D # Define a node protobuf and check whether it's valid
##D node_def <- make_node("Relu", list("X"), list("Y"))
##D check(node_def)
##D 
##D # Define an attribute protobuf and check whether it's valid
##D attr_def <- make_attribute("this_is_an_int", 123L)
##D check(attr_def)
##D 
##D # Define a graph protobuf and check whether it's valid
##D graph_def <- make_graph(
##D     nodes = list(
##D       make_node("FC", list("X", "W1", "B1"), list("H1")),
##D       make_node("Relu", list("H1"), list("R1")),
##D       make_node("FC", list("R1", "W2", "B2"), list("Y"))
##D     ),
##D     name = "MLP",
##D     inputs = list(
##D       make_tensor_value_info('X' , onnx$TensorProto$FLOAT, list(1L)),
##D       make_tensor_value_info('W1', onnx$TensorProto$FLOAT, list(1L)),
##D       make_tensor_value_info('B1', onnx$TensorProto$FLOAT, list(1L)),
##D       make_tensor_value_info('W2', onnx$TensorProto$FLOAT, list(1L)),
##D       make_tensor_value_info('B2', onnx$TensorProto$FLOAT, list(1L))
##D     ),
##D     outputs = list(
##D       make_tensor_value_info('Y', onnx$TensorProto$FLOAT, list(1L))
##D     )
##D )
##D check(graph_def)
##D 
## End(Not run)




