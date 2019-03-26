library(onnx)


### Name: print_readable
### Title: Print the Human-readable Representation of the Proto Object
### Aliases: print_readable

### ** Examples

## Not run: 
##D 
##D library(onnx)
##D 
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
##D print_readable(graph_def)
##D 
## End(Not run)



